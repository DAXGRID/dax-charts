# Route network search indexer

Route network search indexer consumes messages from Kafka in the OPEN-FTTH solution on topic `domain.route-network` and inserts the ones with `Naming.Name` set into Typesense. If there is any updates to an already inserted feature it will be either, updated or deleted.

## Install upgrade

Add the repository.

```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

Example of installing it with overridden parameters.

```sh
helm upgrade --install route-network-search-indexer dax/route-network-search-indexer \
     --namespace my-namespace \
     --set kafka.positionConnectionString="Host=my-host;Port=5432;Username=postgres;Password=postgres;Database=my-database" \
     --set typesense.apiKey="myApiKey"
```
