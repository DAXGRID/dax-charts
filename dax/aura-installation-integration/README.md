## Aura outage integration

Chart for [Aura installation integration.](https://github.com/DAXGRID/aura-installation-integration)

## Install/Upgrade

Add the repository.

```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

Example of installing it with overridden parameters.

```sh
helm upgrade --install aura-installation-integration dax/aura-installation-integration \
     --version REPLACE_WITH_VERSION
     --namespace REPLACE_WITH_NAMESPACE \
     --set appsettings.settings.databaseConnectionString="" \
     --set appsettings.settings.serviceBus.connectionString="" \
     --set appsettings.settings.serviceBus.topicName="" \
     --set appsettings.settings.serviceBus.subscriptionName="" \
     --set appsettings.settings.serviceBus.headerTypeName="" \
     --set appsettings.settings.graphQL.endPoint="" \
     --set appsettings.settings.graphQL.clientId="" \
     --set appsettings.settings.graphQL.clientSecret="" \
     --set appsettings.settings.graphQL.tokenEndPoint=""
```
