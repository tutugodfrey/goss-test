# Working with Goss


```bash
apt install apache2
```

```bash
apt install nginx
```

```bash
useradd -m 
```

```bash
touch testgoss.txt
```

```bash
goss -g /etc/goss/goss.yaml autoadd ./values.yml
```

```bash
goss -g /etc/goss/goss.yaml autoadd nginx
```

```bash
goss -g /etc/goss/goss.yaml autoadd apache2
```

```bash
goss -g /etc/goss/goss.yaml autoadd curl wget lsof
```

```bash
goss -g /etc/goss/goss.yaml autoadd ryan
```


```bash
apt remove wget
```


```bash
kubectl run nginx --image nginx --dry-run=client -o yaml > nginx.yaml
```


Use pushgateway to send metrics to prometheus

```bash
while true; do goss -g /etc/goss/goss.yaml validate --format=prometheus | curl --data-binary @- http://172.30.1.2:30842/metrics/job/goss; echo metrics sent; sleep 20; done;


vi /etc/cron.d/goss

*/1 * * * * goss -g /etc/goss/goss.yaml validate --format=prometheus | curl --data-binary @- http://172.30.1.2:30842/metrics/job/goss;

*/1 * * * * root /usr/local/bin/goss -g /etc/goss/goss.yaml validate --format=prometheus | curl --data-binary @- http://172.30.1.2:32582/metrics/job/goss/instance/$(hostname) > /var/log/goss.log;
```

```bash
goss_tests_outcomes_total{outcome="fail", exported_job="goss"}
```

```bash
[Unit]
Description=test

[Timer]
OnUnitActiveSec=2m
OnBootSec=10s

[Install]
WantedBy=timers.target



[Unit]
Description=Goss service check

[Service]
#Restart=on-failure
#RestartSec=15
WorkingDirectory=/etc/goss
Type=oneshot
ExecStart=/usr/bin/goss

[Install]
WantedBy=multi-user.target
```
