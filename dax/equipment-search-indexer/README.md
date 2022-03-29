# Equipment search indexer

Equipment search indexer consumes messages form the event store and inserts them into Typesense `equipments` collection.

## Install upgrade

First add the repository.

```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

```sh
helm upgrade --install equipment-search-indexer equipment-search-indexer \
     --namespace openftth \
     --set "specifications[0]"=myFirstSpecification \
     --set "specifications[1]"=mySecondSpecification \
     --set connectionstring="Host=openftth-event-store-postgresql;Port=5432;Username=postgres;Password=postgres;Database=EVENT_STORE" \
     --set typesense.apiKey="changeMe"
```

## Parameters

Parameters for the helm chart.

| Parameter                   | Description                         | Default                             |
|-----------------------------|-------------------------------------|-------------------------------------|
| `image.repository`          | Image                               | `openftth/equipment-search-indexer` |
| `image.tag`                 | Image tag                           | Latest image tag                    |
| `logLevel`                  | Log level for the application       | `information`                       |
| `connectionString`          | Connectionstring to the event store | `""`                                |
| `specifications`            | Equipment specification to index    | `""`                                |
| `typesense.host`            | Typesense host                      | `openftth-search-typesense`         |
| `typesense.port`            | Typesense port                      | `80`                                |
| `typesense.protocol`        | Typesense protocol                  | `http`                              |
| `typesense.apiKey`          | Typesense API-key                   | `""`                                |
| `typesense.collectionAlias` | Typesense collection alias          | `equipments`                        |
