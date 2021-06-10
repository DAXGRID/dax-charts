# Mbtileserver helm chart

Helm 3 chart for [mbtileserver](https://github.com/consbio/mbtileserver).

The Chart enables you to host the mbtileserver project, it comes with automatic reload of the tileserver using `kill -HUP` when an mbtile is either created, updated or deleted.

## Install/Upgrade

First add the repo
```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

Install the chart
```sh
helm upgrade --install my-release-name dax/mbtileserver \
  --set storage.claimName=my-claim-name \
  --set 'commandArgs={--enable-reload-signal, -d, /data}'
```

## Parameters
Parameters for the helm chart.

| Parameter              | Description                                      | Default                               |
|------------------------|--------------------------------------------------|---------------------------------------|
| `image.repository`     | Image for mbtileserver                           | `"openftth/mbtileserver"`             |
| `image.tag`            | Tag for mbtileserver                             | `v0.7.0`                              |
| `storage.enabled`      | Enable storage                                   | `true`                                |
| `storage.className`    | Name storage class                               | `""`                                  |
| `storage.size`         | The size of the storage                          | `""`                                  |
| `storage.path`         | Path where the storage should be mounted         | `/data`                               |
| `service.externalPort` | The external port                                | `80`                                  |
| `service.type`         | The service type                                 | `LoadBalancer`                        |
| `commandArgs`          | Arguments mbtileserver is called with            | `{--enable-reload-signal, -d, /data}` |
| `reload.enabled`       | Enable reload                                    | `true`                                |
| `reload.watchPath`     | The path where changes should result in a reload | `/data`                               |

helm upgrade --install openftth-routenetwork-tileserver mbtileserver \
  --version 2.2.0 \
  --namespace openftth \
  --set service.type=NodePort \
  --set storage.size=1Gi \
  --set 'commandArgs={--enable-reload-signal, --disable-preview, -d, /data}'
