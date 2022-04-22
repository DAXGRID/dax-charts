# Tile data extract

```sh
helm upgrade --install route-network-tile-data-extract openftth/tile-data-extract \
     --namespace openftth \
     --set fileServer.uri=http://file-server-go-http-file-server \
     --set fileServer.username=user1 \
     --set fileServer.password=pass1
```

Example of a app-settings values.

```yaml
appsettings:
  settings:
    outputFilePath: "/tmp/route_network.geojson"
    connectionString: "Host=openftth-postgis;Port=5432;Username=postgres;Password=postgres;Database=OPEN_FTTH"
    selections:
    - objectType: Feature
      geometryFieldName: coord
      sqlQuery: "select mrid, ST_AsGeoJSON(ST_Transform(coord,4326)) as coord, routenode_kind,
        routenode_function, naming_name, mapping_method, lifecycle_deployment_state
        from route_network.route_node where coord is not null and marked_to_be_deleted = false"
      defaultZoom:
        minZoom: 17
        maxZoom: 17
      customZoom:
        fieldName: routenode_kind
        zoomMap:
          CentralOfficeBig:
            minZoom: 5
            maxZoom: 22
          CentralOfficeMedium:
            minZoom: 5
            maxZoom: 22
          CentralOfficeSmall:
            minZoom: 5
            maxZoom: 22
          CabinetBig:
            minZoom: 12
            maxZoom: 22
      extraProperties:
        objecttype: route_node
    - objectType: Feature
      geometryFieldName: coord
      sqlQuery: "select mrid, ST_AsGeoJSON(ST_Transform(coord, 4326)) as coord, routesegment_kind,
        mapping_method, lifecycle_deployment_state from route_network.route_segment
        where coord is not null and marked_to_be_deleted = false"
      defaultZoom:
        minZoom: 12
        maxZoom: 22
      customZoom:
      extraProperties:
        objecttype: route_segment
```
