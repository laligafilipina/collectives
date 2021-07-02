[Unit]
Description=Prometheus Node Exporter Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/node_exporter --web.listen-address=":9091"

[Install]
WantedBy=multi-user.target
