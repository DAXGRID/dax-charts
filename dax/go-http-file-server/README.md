# Go HTTP File Server Chart

This is made to be used by the OpenFTTH system and is not a general Chart for [go-http-file-server](https://github.com/mjpclab/go-http-file-server).

## Install/Upgrade

Add the repository.

```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

Example of installing it with overridden parameters.

```sh
helm upgrade --install my-release-name dax/go-http-file-server \
  --namespace my-namespace
```
