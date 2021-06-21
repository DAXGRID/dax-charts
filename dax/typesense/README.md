# Typesense helm chart

Helm 3 chart for [Typesense](https://github.com/typesense/typesense).

## Install/Upgrade

First add the repo
```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

Install the chart
```sh
helm upgrade --install my-release-name dax/typesense \
  --namespace my-namespace \
  --set apiKey=changeMe!
```

## Parameters

Parameters for the helm chart.

| Parameter                 | Description                              | Default                 |
|---------------------------|------------------------------------------|-------------------------|
| `image.repository`        | Image for typesense                      | `"typesense/typesense"` |
| `image.tag`               | Tag for typesense                        | `0.2.0`                 |
| `apiKey`                  | Api key for Typesense                    | `changeme!`             |
| `replicas`                | The replica count                        | `1`                     |
| `port`                    | External port                            | `80`                    |
| `serviceType`             | External service type                    | `NodePort`              |
| `storage.className`       | Name storage class                       | `""`                    |
| `storage.size`            | The size of the storage                  | `"4Gi"`                 |
| `storage.path`            | Path where the storage should be mounted | `/data`                 |
| `resources.memoryRequest` | Memory request                           | `50Mi`                  |
| `resources.memoryLimit`   | Memory limit                             | `150Mi`                 |
