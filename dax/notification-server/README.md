# Notification server

Chart for notification server [link.](https://github.com/DAXGRID/open-ftth-notification-server)

# Setup chart repository

Add the repository.

```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update dax
```

## Install/Upgrade

Example of installing

```sh
helm upgrade --install notification-server dax/notification-server \
     --version MY_VERSION \
     --namespace MY_NAMESPACE
```
