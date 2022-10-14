Aura Address Integrator

Chart for Aura Address integrator [link.](https://github.com/DAXGRID/aura-address-integrator)

## Install/Upgrade

First add the repository

```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

Example of installing it with overridden parameters.

```sh
helm upgrade --install aura-address-integrator dax/aura-address-integrator \
     --namespace openftth \
     --set appsettings.settings.eventStoreConnectionString="my_eventstore_connection_string" \
     --set appsettings.settings.serviceBusConnectionString="my_servicebus_connection_string" \
     --set appsettings.settings.serviceBusTopicName="my_topic_name" \
     --set appsettings.settings.serviceBusSubscriptionName="my_subscription_name" \
     --set appsettings.settings.serviceBusHeaderTypeName="my_header_name"
```
