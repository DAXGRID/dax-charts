# Address import DAWA chart

## Install upgrade

First add the repository.

```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

```sh
helm upgrade --install address-import-dawa dax/address-import-dawa \
     --namespace openftth \
     --set appsettings.settings.eventStoreConnectionString="Host=openftth-event-store-postgresql;Port=5432;Username=postgres;Password=postgres;Database=EVENT_STORE"
```

| Parameter                                         | Description                          | Default                        |
|---------------------------------------------------|--------------------------------------|--------------------------------|
| `image.repository`                                | Image                                | `openftth/address-import-dawa` |
| `image.tag`                                       | Image tag                            | Latest image tag               |
| `schedule`                                        | How often the job should run         | `0 0 * * *`                    |
| `appsettings.settings.eventStoreConnectionString` | Connection string to the event store | `""`                           |
