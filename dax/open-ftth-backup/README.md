# OpenFTTH backup

Chart for the OpenFTTH backup system [link.](https://github.com/DAXGRID/open-ftth-backup)

## Install/upgrade

Add the repository.

```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

Example of installing it with overridden parameters.

```sh
helm upgrade --install my-release-name dax/open-ftth-backup \
     -f ./my_override_file.yaml \
     --version MY_VERSION \
     --namespace MY_NAMESPACE
```

### Example of override file

```yaml
appsettings:
  settings:
    uploadPath: backups
    postgresBackups:
      - connection:
          hostAddress: "my-database-host"
          port: 5432
          username: "postgres"
          password: "postgres"
        dumpFilenamePrefix: MY_DUMP_FILE_PREFIX_NAME
    fileServer:
      hostAddress: "http://my-http-file-server"
      username: user1
      password: pass1
```
