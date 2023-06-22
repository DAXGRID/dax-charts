# Nord energi installation integrator

Chart for Nord energi installation integrator [link.](https://github.com/DAXGRID/nord-energi-installation-integrator)

## Install/Upgrade

Add the repository.

```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

Example of installing it with overridden parameters.

Nord energi installation integrator
```sh
helm upgrade --install nord-energi-installation-integrator dax/nord-energi-installation-integrator \
     --version MY_VERSION \
     --namespace MY_NAMESPACE \
     --set appsettings.settings.fileServer.username="user1" \
     --set appsettings.settings.fileServer.password="pass1" \
     --set appsettings.settings.connectionString="Host=openftth-postgis-postgresql;Port=5432;Username=postgres;Password=postgres;Database=OPEN_FTTH"
```
