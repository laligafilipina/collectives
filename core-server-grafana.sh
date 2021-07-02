#!/bin/bash

#make sure ufw disabled
ufw disable

#optional settings
prometheus --web.listen-address=":9090" --storage.tsdb.no-lockfile

#install packages and other dependencies and make sure to setup stable version
apt-get install -y apt-transport-https
apt-get install -y software-properties-common wget
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://packages.grafana.com/enterprise/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
apt-get -y update
apt-get -y install grafana

#always follow the binary setup
apt-get -y install unzip
apt-get -y install prometheus

vim /etc/prometheus/prometheus.yml

#default prometheus 9090
#- job_name: node
#  static configs:
#    node_exporter 9091 http://localhost:9091/metrics
#    - targets: ['localhost:9091']

systemctl prometheus.service restart

wget https://github.com/prometheus/node_exporter/releases/download/v1.0.1/node_exporter-1.0.1.linux-amd64.tar.gz
wget https://github.com/grafana/loki/releases/download/v1.5.0/promtail-linux-amd64.zip
wget https://github.com/grafana/loki/releases/download/v1.5.0/loki-linux-amd64.zip

tar xzvf node_exporter-1.0.1.linux-amd64.tar.gz
unzip promtail-linux-amd64.zip
unzip loki-linux-amd64.zip

mv promtail-linux-amd64 promtail
mv loki-linux-amd64 loki
mv node_exporter-1.0.1.linux-amd64 node_exporter

mkdir promtail_exporter
mkdir loki_exporter
mkdir node_exporter

mv promtail ./promtail_exporter
mv loki ./loki_exporter
mv node_exporter ./node_exporter

ln -s /root/node_exporter/node_exporter /usr/local/bin/node_exporter
ln -s /root/promtail_exporter/promtail /usr/local/bin/promtail
ln -s /root/loki_exporter/loki /usr/local/bin/loki

#promtail configuration file
vim /root/promtail_exporter/config.yaml

#inside promtail configuration file config.yaml
#server:
#  http_listen_port: 9093
#  grpc_listen_port: 0

#positions:
#  filename: /tmp/positions.yml

#clients:
#  - url: http://localhost:9092/loki/api/v1/push

#scrape_configs:
#  - job_name: system
#    pipeline_stages:
#    static_configs:
#    - targets:
#        - localhost
#      labels:
#        job: varlogs
#        host: ward_workstation
#        agent: promtail
#        __path__: /var/log/nginx/*.log


#loki configuration file
vim /root/loki_exporter/config.yaml

#inside loki configuration file config.yaml
#auth_enabled: false

#server:
#  http_listen_port: 9092

#ingester:
#  lifecycler:
#    address: 127.0.0.1
#    ring:
#      kvstore:
#        store: inmemory
#      replication_factor: 1
#    final_sleep: 0s
#  chunk_idle_period: 5m
#  chunk_retain_period: 30s
#  max_transfer_retries: 0

#schema_config:
#  configs:
#    - from: 2020-07-15
#      store: boltdb
#      object_store: filesystem
#      schema: v11
#      index:
#        prefix: index_
#        period: 168h

#storage_config:
#  boltdb:
#    directory: /tmp/loki/index

# filesystem:
#    directory: /tmp/loki/chunks

#limits_config:
#  enforce_metric_name: false
#  reject_old_samples: true
#  reject_old_samples_max_age: 168h

#chunk_store_config:
#  max_look_back_period: 0s

#table_manager:
#  chunk_tables_provisioning:
#    inactive_read_throughput: 0
#    inactive_write_throughput: 0
#    provisioned_read_throughput: 0
#    provisioned_write_throughput: 0
#  index_tables_provisioning:
#    inactive_read_throughput: 0
#    inactive_write_throughput: 0
#    provisioned_read_throughput: 0
#    provisioned_write_throughput: 0

#  retention_deletes_enabled: false
#  retention_period: 0s

#create service node-exporter.service
vim /etc/systemd/system/node-exporter.service

#inside file node-exporter.service
#[Unit]
#Description=Prometheus Node Exporter Service
#After=network.target
#[Service]
#Type=simple
#ExecStart=/usr/local/bin/node_exporter --web.listen-address=":9091"
#[Install]
#WantedBy=multi-user.target

vim /etc/systemd/system/loki.service
#create service loki.service
#[Unit]
#Description=Loki Service
#After=network.target
#[Service]
#Type=simple
#ExecStart=/usr/local/bin/loki -config.file=/root/loki_exporter/config.yaml
#[Install]
#WantedBy=multi-user.target

vim /etc/systemd/system/promtail.service
#create service promtail.service
#[Unit]
#Description=Promtail Service
#After=network.target
#[Service]
#Type=simple
#ExecStart=/usr/local/bin/promtail -config.file=/root/promtail_exporter/config.yaml
#[Install]
#WantedBy=multi-user.target

#restart the daemon service
systemctl daemon-reload

#start services
systemctl node-exporter.service start
systemctl start loki.service
systemctl start promtail.service

#check status
systemctl status prometheus.service
systemctl status node-exporter
systemctl status loki.service
systemctl status promtail.service
