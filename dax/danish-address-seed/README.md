# Danish Address Seed

## Install/Upgrade
First add the repo
```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

Example of usage.
```sh
helm upgrade --install my-release-name dax/danish-address-seed \
     --version 1.0.0 \
     --namespace my-namespace \
     --set schedule="*0 0 * * *" \
     --set connectionString="Host=localhost;Port=5432;Username=postgres;Password=postgres;Database=OPEN_FTTH"
```
