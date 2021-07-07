# Route network search indexer

Route network search indexer consumes messages from Kafka in the OPEN-FTTH solution on topic `domain.route-network` and inserts the ones with `Naming.Name` set into Typesense. If there is any updates to an already inserted feature it will be either, updated or deleted.

## Install upgrade

First add the repo
```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

```sh
helm upgrade --install route-network-search-indexer dax/route-network-search-indexer \
     --namespace my-namespace \
     --set kafka.positionConnectionString="Host=my-host;Port=5432;Username=postgres;Password=postgres;Database=my-database" \
     --set typesense.apiKey="myApiKey"
```

## Parameters

Parameters for the helm chart.

| Parameter                        | Description                                  | Default                          |
|----------------------------------|----------------------------------------------|----------------------------------|
| `image.repository`               | Image for danish-address-seed                | `"openftth/danish-address-seed"` |
| `image.tag`                      | Tag for typesense                            | `v2.0.0`                         |
| `logLevel`                       | Log level for the application                | `"information"`                  |
| `kafka.consumer`                 | Kafka consumer name                          | `route_network_search_indexer`   |
| `kafka.positionConnectionString` | Kafka positon connectionstring               | `""`                             |
| `kafka.topic`                    | Kafka topic to consume                       | `domain.route-network`           |
| `connectionString`               | The connectionstring to the postgis database | `""`                             |
| `typesense.host`                 | Typesense host                               | `""`                             |
| `typesense.port`                 | Typesense port                               | `80`                             |
| `typesense.protocol`             | Typesense protocol                           | `http`                           |
| `typesense.apiKey`               | Typesense apikey                             | `""`                             |
