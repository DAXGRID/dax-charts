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

If the job requires config files or other scripts, specify them the following way:

```sh
helm upgrade --install new-file-job-operator dax/new-file-job-operator \
  --install \
  --namespace my-namespace \
  --set "jobFiles[0].name=myconfig.json" \
  --set-file "jobFiles[0].value=/home/my_user/myconfig.json"
  --set "jobFiles[1].name=my_other_config.xml" \
  --set-file "jobFiles[1].value=/home/my_user/my_other_config.xml"
```
