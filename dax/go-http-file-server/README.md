# Go HTTP File Server Chart

This is made to be used by the OpenFTTH system and is not a general Chart for go-http-file-server.

## Install/Upgrade

First add the repo
```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

Install the chart
```sh
helm upgrade --install my-release-name dax/go-http-file-server \
  --namespace my-namespace \
  --set username=changeMe! \
  --set password=changeMe!
```

## Parameters

Parameters for the helm chart.

| Parameter                     | Description                              | Default                                       |
|-------------------------------|------------------------------------------|-----------------------------------------------|
| `image.repository`            | Image for typesense                      | `"openftth/go-http-file-server"`              |
| `image.tag`                   | Tag for typesense                        | `v1.2.0`                                      |
| `replicas`                    | The replica count                        | `1`                                           |
| `port`                        | External port                            | `80`                                          |
| `serviceType`                 | External service type                    | `NodePort`                                    |
| `storage.className`           | Name storage class                       | `""`                                          |
| `storage.size`                | The size of the storage                  | `"4Gi"`                                       |
| `storage.path`                | Path where the storage should be mounted | `/data`                                       |
| `username`                    | Basic auth username                      | `user1`                                       |
| `password`                    | Basic auth password                      | `pass1`                                       |
| `fileWatcher.image`           | Filewatcher image                        | `openftth/file-watcher-kafka`                 |
| `fileWatcher.tag`             | Filewatcher tag                          | `v1.1.0`                                      |
| `fileWatcher.kafka.consumer`  | Filewatcher kafka consumer name          | `file_watcher_kafka`                          |
| `fileWatcher.kafka.server`    | Filewathcer kafka server                 | `openftth-kafka-cluster-kafka-bootstrap:9092` |
| `fileWatcher.kafka.topic`     | Filewatcher kafka topic                  | `notification.file-changes`                   |
| `fileWatcher.watch.directory` | Filewatcher directory to watch           | `/data`                                       |
