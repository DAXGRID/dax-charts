# Tippecanoe helm chart

Helm 3 chart for [Tippecanoe](https://github.com/mapbox/tippecanoe). The chart setups a Kubernetes `CronJob` where you can specify how often it should run and what arguments Tippecanoe should be called with. The Helm chart also allows you to run a pre-job using [GDAL](https://github.com/OSGeo/gdal) or your own configuration. This can be enabled using the Chart configurations.

## Install/Upgrade

Add the repository.

```sh
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
```

Example of usage.

```sh
helm upgrade --install my-release-name dax/tippecanoe \
     --set schedule="*/5 * * * *" \
     --set commandArgs='tippecanoe -zg -o /data/out.mbtiles --drop-densest-as-needed /data/output.geojson --force' \
     --set storage.enabled=true \
     --set storage.claimName=my-claim-name \
     --set storage.path=/data
```

Example of using with a GDAL pre-job before the Tippecanoe job.

```sh
helm upgrade --install my-release-name dax/tippecanoe \
     --set schedule="*/5 * * * *" \
     --set commandArgs='tippecanoe -zg -o /data/out.mbtiles --drop-densest-as-needed /data/output.geojson --force' \
     --set storage.enabled=true \
     --set storage.claimName=my-claim-name \
     --set storage.path=/data \
     --set prejob.enabled=true \
     --set prejob.commandArgs='ogr2ogr -f GeoJSON /data/output.geojson PG:"host=localhost dbname=MY_DB user=myuser password=mypassword" -sql "select id, ST_Transform(wkb_geometry\, 4326) as wkb_geometry from my_table"'
```
