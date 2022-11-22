# Typesense helm chart

Helm 3 chart for [Typesense](https://github.com/typesense/typesense).

## Install/Upgrade

Add the repository.

```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

Example of installing it with overridden parameters.

```sh
helm upgrade --install my-release-name dax/typesense \
  --namespace my-namespace \
  --set apiKey=changeMe!
```
