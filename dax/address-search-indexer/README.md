# Address search indexer

## Install upgrade

First add the repository.

```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

```sh
helm upgrade --install address-search-indexer dax/address-search-indexer \
     --namespace openftth \
     --set appsettings.settings.eventStoreConnectionString="Host=openftth-event-store-postgresql;Port=5432;Username=postgres;Password=postgres;Database=EVENT_STORE" \
     --set appsettings.settings.typesense.key="changeMe!"
```
