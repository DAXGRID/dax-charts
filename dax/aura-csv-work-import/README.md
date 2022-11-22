# Aura CSV work import

Chart for Aura CSV work import [link.](https://github.com/DAXGRID/aura-csv-work-import)

## Install/Upgrade

Add the repository.

```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

Example of installing it with overridden parameters.

```sh
helm upgrade --install aura-csv-work-import dax/aura-csv-work-import \
     --namespace openftth \
     --set "appsettings.settings.kafka.notificationFullFilePaths[0]"="/Projekter.csv" \
     --set "appsettings.settings.kafka.notificationFullFilePaths[1]"="/Eftertilslutninger.csv" \
     --set "appsettings.settings.kafka.notificationFullFilePaths[2]"="/Opgaver i projekter.csv" \
     --set appsettings.settings.fileServer.username="user1" \
     --set appsettings.settings.fileServer.password="pass1" \
     --set appsettings.settings.eventStoreConnectionString="Host=openftth-event-store-postgresql;Port=5432;Username=postgres;Password=postgres;Database=EVENT_STORE"
```
