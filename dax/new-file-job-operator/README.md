# New File Job Operator

## Install upgrade

Add the repository.

```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

Example of installing it with overridden parameters in the namespace named: 'my-namespace'. The default configuration expects that a file-server is setup in the default namespace with the name "file-server-go-http-file-server".

```sh
helm upgrade --install new-file-job-operator dax/new-file-job-operator \
     --namespace my-namespace
```
