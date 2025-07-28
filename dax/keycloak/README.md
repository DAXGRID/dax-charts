# Keycloak Helm Chart

## Install Nginx

```sh
helm upgrade --install nginx-ingress ingress-nginx/ingress-nginx \
    --version 4.12.2 \
    --namespace nginx-ingress \
    --create-namespace \
    --set controller.service.externalTrafficPolicy=Local \
    --set controller.ingressClassResource.default=true \
    --set controller.replicaCount=1
```

## Install Postgres

```sh
helm upgrade --install keycloak-postgres dax/postgresql \
    --set username="postgres" \
    --set password="postgres" \
    --set databaseName="keycloak"
```

## Install Keycloak

```sh
helm upgrade --install keycloak dax/keycloak \
    --set hostname="auth.test.local" \
    --set initialUsername="keycloak_user" \
    --set initialPassword="keycloak_password" \
    --set database.connectionstring="jdbc:postgresql://keycloak-postgres/keycloak" \
    --set database.username="postgres" \
    --set database.password="postgres"
```

## Setup Ingress Route

```sh
cat <<EOF | kubectl apply -f -
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: keycloak-ingress
  annotations:
    nginx.ingress.kubernetes.io/proxy-buffer-size: "8k"
spec:
  ingressClassName: nginx
  rules:
  - host: auth.test.local
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: keycloak
            port:
              number: 80
EOF
```
