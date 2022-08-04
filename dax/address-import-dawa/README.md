# Address import DAWA chart

## Install upgrade

First add the repository.

```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

```sh
helm upgrade --install equipment-search-indexer equipment-search-indexer \
     --namespace openftth \
     --set appsettings.settings.eventStoreConnectionString="Host=openftth-event-store-postgresql;Port=5432;Username=postgres;Password=postgres;Database=EVENT_STORE" \
```

| Parameter                                         | Description                         | Default                        |
|---------------------------------------------------|-------------------------------------|--------------------------------|
| `image.repository`                                | Image                               | `openftth/address-import-dawa` |
| `image.tag`                                       | Image tag                           | Latest image tag               |
| `appsettings.settings.eventStoreConnectionString` | Connection string to the event store | `""`                           |
