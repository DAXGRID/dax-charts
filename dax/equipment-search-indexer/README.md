# Equipment search indexer

Equipment search indexer consumes messages form the event store and inserts them into Typesense `equipments` collection.

## Install upgrade

First add the repository.

```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

```sh
helm upgrade --install equipment-search-indexer dax/equipment-search-indexer \
     --namespace my-namespace \
     --set connectionstring="Host=my-host;Port=5432;Username=postgres;Password=postgres;Database=my-database" \
     --set typesense.apiKey="myApiKey"
```

## Parameters

Parameters for the helm chart.

| Parameter            | Description                         | Default                               |
|----------------------|-------------------------------------|---------------------------------------|
| `image.repository`   | Image                               | `"openftth/equipment-search-indexer"` |
| `image.tag`          | Image tag                           | Latest image tag                      |
| `logLevel`           | Log level for the application       | `"information"`                       |
| `ConnectionString`   | Connectionstring to the event store | `""`                                  |
| `typesense.host`     | Typesense host                      | `"openftth-search-typesense"`         |
| `typesense.port`     | Typesense port                      | `80`                                  |
| `typesense.protocol` | Typesense protocol                  | `http`                                |
| `typesense.apiKey`   | Typesense API-key                   | `""`                                  |
