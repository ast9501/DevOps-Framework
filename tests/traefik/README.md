# Traefik test
>Source from https://ithelp.ithome.com.tw/articles/10301213

## Deploy sample web application
```
kubectl apply -f 01-nginx-application.yaml
```

## Test Ingress Path
* Deploy ingress rule
```
kubectl apply -f 02-ingress-path.yaml
```

* Test
```
# http
curl -k http://web.example.domain.com/web1 --resolve web.example.domain.com:80:<your-loadbalancer-ip>
curl -k http://web.example.domain.com/web2 --resolve web.example.domain.com:80:<your-loadbalancer-ip>

# https
curl -k https://web.example.domain.com/web1 --resolve web.example.domain.com:443:<your-loadbalancer-ip>
curl -k https://web.example.domain.com/web2 --resolve web.example.domain.com:443:<your-loadbalancer-ip>
```

## Test Ingress Host
* Deploy ingress rule
```
kubectl apply -f 03-ingress-host.yaml
```

* Test
```
# http
curl -k http://web1.example.domain.com --resolve web1.example.domain.com:80:<your-loadbalancer-ip>
curl -k http://web2.example.domain.com --resolve web2.example.domain.com:80:<your-loadbalancer-ip>

# https
curl -k https://web1.example.domain.com --resolve web1.example.domain.com:443:<your-loadbalancer-ip>
curl -k https://web2.example.domain.com --resolve web2.example.domain.com:443:<your-loadbalancer-ip>
```
