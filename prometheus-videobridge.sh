#!/bin/bash

echo -e "[+]disabling firewall configs"
ufw status verbose
ufw disable

echo -e "[+]updating system"
apt-get -y update

echo -e "[+]installing unzip and prometheus"
apt-get -y install unzip prometheus

echo -e "[+]prometheus process setup"
systemctl stop prometheus
rm /etc/prometheus/prometheus.yml
curl -s https://raw.githubusercontent.com/coderlava/improved-octo-invention/master/prometheus.yml > /etc/prometheus/prometheus.yml
echo -e "[+]prometheus configuration renew and now starting"
systemctl start prometheus

echo -e "[+]node exporter setup"
wget https://github.com/prometheus/node_exporter/releases/download/v1.0.1/node_exporter-1.0.1.linux-amd64.tar.gz
tar xzvf node_exporter-1.0.1.linux-amd64.tar.gz
rm node_exporter-1.0.1.linux-amd64.tar.gz
mv node_exporter-1.0.1.linux-amd64 node_exporter
ln -s /root/node_exporter/node_exporter /usr/local/bin/node_exporter
curl -s https://raw.githubusercontent.com/coderlava/improved-octo-invention/master/node-exporter-service > /etc/systemd/system/node-exporter.service

echo -e "[+]downloading promtail and loki binary"
wget https://github.com/grafana/loki/releases/download/v1.5.0/promtail-linux-amd64.zip
wget https://github.com/grafana/loki/releases/download/v1.5.0/loki-linux-amd64.zip

echo -e "[+]unzipping promtail and loki"
unzip promtail-linux-amd64.zip
unzip loki-linux-amd64.zip
rm loki-linux-amd64.zip
rm promtail-linux-amd64.zip

mv promtail-linux-amd64 promtail
mv loki-linux-amd64 loki

mkdir promtail_exporter
mkdir loki_exporter

mv promtail promtail_exporter/
mv loki loki_exporter/

echo -e "[+]creating binary link file promtail and loki"
ln -s /root/promtail_exporter/promtail /usr/local/bin/promtail
ln -s /root/loki_exporter/loki /usr/local/bin/loki

echo -e "[+]downloading promtail and loki config.yaml"
curl -s https://raw.githubusercontent.com/coderlava/improved-octo-invention/master/promtail.yml > /root/promtail_exporter/config.yaml
curl -s https://raw.githubusercontent.com/coderlava/improved-octo-invention/master/loki.yml > /root/loki_exporter/config.yaml

echo -e "[+]downloading promtail and loki configuration service"
curl -s https://raw.githubusercontent.com/coderlava/improved-octo-invention/master/loki-service > /etc/systemd/system/loki.service
curl -s https://raw.githubusercontent.com/coderlava/improved-octo-invention/master/promtail-service > /etc/systemd/sytem/promtail.service

echo -e "[+]restarting daemon service"
systemctl daemon-reload
systemctl start node-exporter.service
systemctl start loki.service
systemctl start promtail.service
systemctl status node-exporter.service
systemctl status loki.service
systemctl status promtail.service
echo -e "[+]process for grafana setup done..."
