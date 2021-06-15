# Tegola helm chart

Helm 3 chart for [Tegola](https://github.com/go-spatial/tegola).

## Install/Upgrade

First add the repo
```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

Parse in your Tengola config file as `config`.
```sh
helm upgrade --install my-release-name dax/tegola \
     --set-file config=./config.toml
```

## Parameters
Parameters for the helm chart.

| Parameter              | Description                     | Default        |
|------------------------|---------------------------------|----------------|
| `config`               | The config.toml file for Tegola | `""`           |
| `service.type`         | Service type                    | `LoadBalancer` |
| `service.externalPort` | External port                   | `80`           |
| `storage.enabled`      | Enable storage                  | `false`        |
| `storage.size`         | Storage size                    | `1Gi`          |
| `storage.className`    | Storage class                   | `""`           |
| `storage.path`         | Mount path                      | `"/data"`      |
