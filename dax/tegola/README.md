# Tegola helm chart

Helm 3 chart for [Tegola](https://github.com/go-spatial/tegola).

## Install/Upgrade

Add the repository.

```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

Example of installing it with overridden parameters.

```sh
helm upgrade --install my-release-name dax/tegola \
     --set-file config=./config.toml
```
