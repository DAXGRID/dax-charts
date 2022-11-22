# Equipment search indexer

Equipment search indexer consumes messages form the event store and inserts them into Typesense `equipments` collection.

## Install upgrade

Add the repository.

```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

Example of installing it with overridden parameters.

```sh
helm upgrade --install equipment-search-indexer equipment-search-indexer \
     --namespace openftth \
     --set "specifications[0]"=myFirstSpecification \
     --set "specifications[1]"=mySecondSpecification \
     --set connectionstring="Host=openftth-event-store-postgresql;Port=5432;Username=postgres;Password=postgres;Database=EVENT_STORE" \
     --set typesense.apiKey="changeMe"
```
