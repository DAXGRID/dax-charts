# Postgres script runner

Chart that supports calling a script. The script will have access to using the command line program `psql`.

## Example of injecting a script that can be executed.

```sh
helm upgrade postgres-client-job dax/postgres-script-runner \
  --install \
  -n my-namespace \
  --set "files[0].name=execute.sh" \
  --set-file "files[0].value=/home/my_user/execute.sh"
```

## Example of how a script could look like.

```sh
#!/usr/bin/env bash

psql -U $PGUSERNAME -d MY_DB_NAME -h $PGHOST -p $PGPORT -c 'SELECT COUNT(*) FROM route_network.route_segment'
```
