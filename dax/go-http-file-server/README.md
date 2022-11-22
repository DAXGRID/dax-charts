# Go HTTP File Server Chart

This is made to be used by the OpenFTTH system and is not a general Chart for [go-http-file-server](https://github.com/mjpclab/go-http-file-server).

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
