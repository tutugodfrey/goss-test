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
