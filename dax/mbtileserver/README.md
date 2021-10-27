# Mbtileserver

A Helm chart for mbtileserver. This Chart is custom for our organization, so it is not a general purpose helm chart.

## Values

| Key                                    | Type   | Default                        | Description |
|----------------------------------------|--------|--------------------------------|-------------|
| commandArgs[0]                         | string | `"--enable-reload-signal"`     |             |
| commandArgs[1]                         | string | `"-d"`                         |             |
| commandArgs[2]                         | string | `"/data"`                      |             |
| image.repository                       | string | `"openftth/mbtileserver"`      |             |
| image.tag                              | string | `"v0.7.0"`                     |             |
| service.externalPort                   | int    | `80`                           |             |
| service.type                           | string | `"ClusterIP"`                  |             |
| watcher.enabled                        | bool   | `false`                        |             |
| watcher.fileServer.password            | string | `""`                           |             |
| watcher.fileServer.uri                 | string | `""`                           |             |
| watcher.fileServer.username            | string | `""`                           |             |
| watcher.image                          | string | `"openftth/tile-watcher"`      |             |
| watcher.kafka.consumer                 | string | `"tile_watcher_route_network"` |             |
| watcher.kafka.server                   | string | `""`                           |             |
| watcher.kafka.topic                    | string | `"notification.file-changes"`  |             |
| watcher.tag                            | string | `"v1.1.0"`                     |             |
| watcher.tileProcess.destination        | string | `"/data"`                      |             |
| watcher.tileProcess.processes[0].name  | string | `""`                           |             |
| watcher.tileProcess.processes[0].value | string | `""`                           |             |
