[Unit]
Description=Loki Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/loki -config.file=/root/loki_exporter/config.yaml

[Install]
WantedBy=multi-user.target
