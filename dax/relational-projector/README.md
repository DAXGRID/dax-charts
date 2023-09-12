# Relational projector

## Install/Upgrade

Add the repository.

```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

Example of installing it with overridden parameters.

```sh
helm upgrade --install relational-projector dax/relational-projector \
     --namespace my-namespace \
     --set eventStoreDatabase.name="EVENT_STORE" \
     --set eventStoreDatabase.username="postgres" \
     --set eventStoreDatabase.password="postgres" \
     --set geoDatabase.name="OPEN_FTTH" \
     --set geoDatabase.username="postgres" \
     --set geoDatabase.password="postgres"
```
