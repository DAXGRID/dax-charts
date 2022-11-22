# Aura outage integration

Chart for [Aura outage integration.](https://github.com/DAXGRID/aura-outage-integration)

## Install/Upgrade

Add the repository.

```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

Example of installing it with overridden parameters.

```sh
helm upgrade --install aura-outage-integration dax/aura-outage-integration \
     --version REPLACE_WITH_VERSION
     --namespace REPLACE_WITH_NAMESPACE \
     --set appsettings.settings.eventStoreConnectionString="my_eventstore_connection_string" \
     --set appsettings.settings.serviceBusConnectionString="my_servicebus_connection_string" \
     --set appsettings.settings.serviceBusTopicName="my_topic_name" \
     --set appsettings.settings.serviceBusHeaderTypeName="my_header_name"
```
