# Relational projector

## Install/Upgrade

First add the repo
```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

Example of usage where it runs every night at 00.00.
```sh
helm upgrade --install danish-address-seed dax/danish-address-seed \
     --namespace my-namespace \
     --set eventStoreDatabase.name="EVENT_STORE" \
     --set eventStoreDatabase.username="postgres" \
     --set eventStoreDatabase.password="postgres" \
     --set geoDatabase.name="OPEN_FTTH" \
     --set geoDatabase.username="postgres" \
     --set geoDAtabase.password="postgres"
```

## Parameters

Parameters for the helm chart.

| Parameter                     | Description                             | Default                           |
|-------------------------------|-----------------------------------------|-----------------------------------|
| `image.repository`            | Image for danish-address-seed           | `"openftth/relational-projector"` |
| `image.tag`                   | Tag for typesense                       | `vx.x.x`                          |
| `resources.memoryRequest`     | How much memory is requested            | `"512Mi"`                         |
| `requests.memoryLimit`        | How much memory before app is restarted | `"768Mi"`                         |
| `eventStoreDatabase.name`     | Eventstore database name                | `"EVENT_STORE"`                   |
| `eventStoreDatabase.username` | Eventstore database username            | `"postgres"`                      |
| `eventStoreDatabase.password` | Eventstore database password            | `"postgres"`                      |
| `geoDatabase.name`            | Geodatabase database name               | `"OPEN_FTTH"`                     |
| `eventStoreDatabase.username` | Geodatabase database username           | `"postgres"`                      |
| `eventStoreDatabase.password` | Geodatabase database password           | `"postgres"`                      |
| `loglevel`                    | Loglevel                                | `"Information"`                   |
