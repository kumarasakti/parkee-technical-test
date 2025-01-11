#!/bin/bash


cat > /usr/local/bin/sample_service.py << 'EOF'
#!/usr/bin/python3
import time
import logging

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(message)s',
    handlers=[
        logging.FileHandler('/var/log/sample_service.log'),
        logging.StreamHandler()
    ]
)

while True:
    logging.info("Service is running")
    time.sleep(60)
EOF

chmod +x /usr/local/bin/sample_service.py

cat > /etc/systemd/system/sample_service.service << 'EOF'
[Unit]
Description=Sample Python Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/sample_service.py
Restart=always
User=root

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload

systemctl enable sample_service
systemctl start sample_service

echo "Service has been created and started"
echo "Use these commands to manage the service:"
echo "systemctl start sample_service"
echo "systemctl stop sample_service"
echo "systemctl status sample_service"