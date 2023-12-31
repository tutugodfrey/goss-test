#! /bin/bash

# curl -L https://github.com/goss-org/goss/releases/latest/download/goss-linux-amd64 -o /usr/local/bin/goss
# chmod +rx /usr/local/bin/goss

VERSION=v0.4.2
curl -L "https://github.com/goss-org/goss/releases/download/${VERSION}/goss-linux-amd64" -o /usr/local/bin/goss
chmod +rx /usr/local/bin/goss

mkdir /etc/goss
cp goss.yaml /etc/goss
cp gosscheck /usr/local/bin/
cp goss.service /etc/systemd/system/
cp goss.timer /etc/systemd/system/
systemctl daemon-reload
systemctl start goss.timer

# kubectl apply -f goss-endpoint.yaml
# kubectl apply -f goss-service.yaml
# kubectl apply -f goss-service-monitor.yaml
kubectl apply -f pushgateway.yaml
sleep 5
# Get NodePort for pushgateway
# PG_NODE_PORT=$(kubectl get svc -n monitoring | grep pushgateway-lb | awk -F" " '{ print $5 }' | awk -F'/' '{ print $1 }' | awk -F':' '{ print $2 }' )
PUSHGATEWAY_NODE_PORT=$(kubectl get svc -n monitoring | grep pushgateway-lb |  awk -F'/' '{ print $1 }' | awk -F':' '{ print $2 }')
sed -i s"|PUSHGATEWAY_PORT|${PUSHGATEWAY_NODE_PORT}|" /usr/local/bin/gosscheck
