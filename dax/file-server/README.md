# File server chart

Add the repository.

```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

Install it

```sh
helm upgrade --install file-server dax/file-server
```
