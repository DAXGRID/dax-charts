# Open FTTH ile data extract

Extracts geojson from postgis and sends it to a file-server.

```sh
helm upgrade --install my-release-name dax/tile-data-extract \
     --set fileServer.uri=http://file-server-go-http-file-server \
     --set fileServer.username=user1 \
     --set fileServer.password=pass1
```

| Parameter                  | Description                  | Default                      |
|----------------------------|------------------------------|------------------------------|
| `image.repository`         | The image repository         | `openftth/tile-data-extract` |
| `image.tag`                | The image version tag        | `v1.4.0`                     |
| `schedule`                 | How often the job should run | `*/30 0 * * *` (Every 30min) |
| `restartPolicy`            | Restartpolicy                | `Never`                      |
| `postgisConnnectionString` | Postgis connectionstring     | ``                           |
| `fileServer.uri`           | Where the storage is mounted | `/data`                      |
| `fileServer.username`      | Fileserver username          | ``                           |
| `fileServer.password`      | Fileserver password          | ``                           |
