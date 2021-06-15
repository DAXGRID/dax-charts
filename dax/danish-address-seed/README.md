# Danish Address Seed

Danish address seed, seeds both an Postgres(PostGIS) database and the Typesense search engine with access and unit addresses from DAWA. The Chart creates a scheduled job that runs on the specified interval to seed the stores.

The first time it runs, it runs a full bulk import, and the next time it runs it will only get the latest changes and sewd with that.


## Install/Upgrade

First add the repo
```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

Example of usage where it runs every night at 00.00.
```sh
helm upgrade --install danish-address-seed dax/danish-address-seed \
     --version 1.1.0 \
     --namespace my-namespace \
     --set schedule="0 0 * * *" \
     --set connectionString="Host=my-host;Port=5432;Username=postgres;Password=postgres;Database=my-database"
```

## Parameters

Parameters for the helm chart.

| Parameter                | Description                                  | Default                          |
|--------------------------|----------------------------------------------|----------------------------------|
| `image.repository`       | Image for danish-address-seed                | `"openftth/danish-address-seed"` |
| `image.tag`              | Tag for typesense                            | `v2.0.0`                          |
| `schedule`               | How often the job should run                 | `0 0 * * *`                      |
| `restartPolicy`          | Restart policy                               | `Never`                          |
| `backoffLimit`           | Backoff limit                                | `0`                              |
| `requests.memoryRequest` | How much memory is requested                 | `"150Mi"`                        |
| `requests.memoryLimit`   | How much memory before app is restarted      | `"300Mi"`                        |
| `connectionString`       | The connectionstring to the postgis database | `""`                             |
| `typesense.host`         | Typesense host                               | `""`                             |
| `typesense.port`         | Typesense port                               | `80`                             |
| `typesense.protocol`     | Typesense protocol                           | `http`                           |
| `typesense.apiKey`       | Typesense apikey                             | `""`                             |
