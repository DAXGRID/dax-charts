# OGR Util

Chart for [ogr-util](https://github.com/DAXGRID/ogr-util).

## Install upgrade

Add the repository.

```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

Example of installing it with overridden parameters. It's important to note that the name of the file do not have to match the local filename. The file names __has__ to be specified in the upgrade statement, unless the file text is so short that is can be specified inside the `values.yaml` file.

```sh
helm upgrade --install ogr-util dax/ogr-util \
    --version my_version \
    --namespace my_namespace \
    --set "files[0].name=example_one.txt" \
    --set-file "files[0].value=/home/myuser/example_one.txt" \
    --set "files[1].name=example_two.txt" \
    --set-file "files[1].value=/home/myuser/example_two.txt"
```
