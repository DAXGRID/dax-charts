## Aura circuit integration

Chart for [Aura circuit integration.](https://github.com/DAXGRID/aura-circuit-integration)

## Install/Upgrade

First add the repository.

```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

Example of installing it with overridden parameters.

```sh
helm upgrade --install aura-circuit-integration dax/aura-circuit-integration \
     --version REPLACE_WITH_VERSION
     --namespace REPLACE_WITH_NAMESPACE \
     --set appsettings.settings.serviceBus.connectionString="" \
     --set appsettings.settings.serviceBus.topicName="" \
     --set appsettings.settings.serviceBus.subscriptionName="" \
     --set appsettings.settings.serviceBus.headerTypeName="" \
     --set appsettings.settings.graphQL.endPoint="" \
     --set appsettings.settings.graphQL.clientId="" \
     --set appsettings.settings.graphQL.clientSecret="" \
     --set appsettings.settings.graphQL.tokenEndPoint=""
```
