# 

```bash
helm create balrog 
```
modifie

test
```
helm install prod --create-namespace -n demo02-helm-prod --dry-run --debug .
```

install prod

```
helm install prod --create-namespace -n demo02-helm-prod
```

prepare staging (nouveau fichier values-staging.yml)


-f

test
```
helm install staging --create-namespace -n demo02-helm-staging --dry-run --debug -f values-staging.yaml .
```

install prod

```
helm install staging --create-namespace -n demo02-helm-staging -f values-staging.yaml 
```


Note : pourrait aussi utiliser le --set clefSousclets:value
```
ingress:
  hosts:
    - host: staging.127.0.0.1.sslip.io
```
serait en cmdline line
```
... --set ingress.hosts[0].host:"staging.127.0.0.1.sslip.io"
```


