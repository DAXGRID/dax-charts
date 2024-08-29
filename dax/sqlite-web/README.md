# Sqlite web

## Install upgrade

Add the repository.

```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

Example of installing it with overridden parameters.

```sh
helm upgrade --install sqlite-web dax/sqlite-web \
     --namespace my-namespace
```
