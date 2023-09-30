# DevOps Framework


# Deploy
## Init terraform
```
terraform init
```

## Deploy network application (metallb, traefik)
The file `terraform/network.tf` keep the network related application manifests
```
terraform apply
```
since Traefik will wait for loadbalance IP bind, we need to declare usable ip range for metallb to asign loadbalancer ip to Traefik (in next step)

### Config metallb ip range
* Modify the ip range in `01-lb-pool.yaml`

* Apply metallb ip-pool config during traefik deployment
Declate IP pool range for metallb then it can assign Load balance IP to Traefik
```
kubectl apply -f manifests/01-lb-pool.yaml
```

### Visit to traefik dashboard
```
kubectl port-forward -n traefik $(kubectl get pods -n traefik --selector "app.kubernetes.io/name=traefik" --output=name) 9000:9000 --address 0.0.0.0
```
for testing Traefik, see `tests/traefik` for more details

# Service/domain mapping list

# Pre-commit hook
## commitlint
```
# Setup nvm and npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
nvm install 18
nvm use 18

# Install commitlint
npm install --save-dev @commitlint/{config-conventional,cli}

# Install commit-msg for pre-commit
pre-commit install --hook-type commit-msg
```
