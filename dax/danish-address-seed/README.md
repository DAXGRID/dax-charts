# Danish Address Seed

## Install/Upgrade
First add the repo
```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

Example of usage where it runs every night at 00.00.
```sh
helm upgrade --install danish-address-seed dax/danish-address-seed \
     --version 1.0.2 \
     --namespace my-namespace \
     --set schedule="0 0 * * *" \
     --set connectionString="Host=my-host;Port=5432;Username=postgres;Password=postgres;Database=my-database"
```
