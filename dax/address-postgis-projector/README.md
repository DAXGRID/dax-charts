# Address postgis projector chart

## Install upgrade

Add the repository.

```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

Example of installing it with overridden parameters.

```sh
helm upgrade --install address-postgis-projector dax/address-postgis-projector \
     --namespace openftth \
     --set appsettings.settings.eventStoreConnectionString="Host=openftth-event-store-postgresql;Port=5432;Username=postgres;Password=postgres;Database=EVENT_STORE" \
     --set appsettings.settings.postgisConnectionString="Host=openftth-postgis;Port=5432;Username=postgres;Password=postgres;Database=OPEN_FTTH"
```
