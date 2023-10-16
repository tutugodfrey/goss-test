#! /bin/bash

curl -L https://github.com/goss-org/goss/releases/latest/download/goss-linux-amd64 -o /usr/local/bin/goss
chmod +rx /usr/local/bin/goss

mkdir /etc/goss
cp goss.yaml /etc/goss
cp gosscheck /usr/local/bin/
cp goss.service /etc/systemd/system/
cp goss.timer /etc/systemd/system/
systemctl daemon-reload
systemctl start goss.timer

kubectl apply -f pushgateway.yaml

# kubectl apply -f goss-endpoint.yaml
# kubectl apply -f goss-service.yaml
# kubectl apply -f goss-service-monitor.yaml
