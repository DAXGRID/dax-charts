# DAX Helm Charts

Helm charts for DAX organization using [Helm](https://github.com/helm/helm) for Kubernetes.

## TL;DR

```bash
helm repo add dax https://daxgrid.github.io/charts/
helm repo update
helm install my-release dax/<chart>
```

## Charts

The repository contains the following Helm charts.

### OpenFTTH
* [Relational-projector](https://github.com/DAXGRID/dax-charts/tree/master/dax/relational-projector)
* [Address-postgis-projector](https://github.com/DAXGRID/dax-charts/tree/master/dax/Address-postgis-projector)
* [Address-import-dawa](https://github.com/DAXGRID/dax-charts/tree/master/dax/address-import-dawa)
* [Address-search-indexer](https://github.com/DAXGRID/dax-charts/tree/master/dax/address-search-indexer)
* [Equipment-search-indexer](https://github.com/DAXGRID/dax-charts/tree/master/dax/equipment-search-indexer)
* [tile-data-extract](https://github.com/DAXGRID/dax-charts/tree/master/dax/tile-data-extract)
* [Route-network-search-indexer](https://github.com/DAXGRID/dax-charts/tree/master/dax/route-network-search-indexer)
* [Danish-address-seed](https://github.com/DAXGRID/dax-charts/tree/master/dax/danish-address-seed)

### Other
* [Tegola](https://github.com/DAXGRID/dax-charts/tree/master/dax/tegola)
* [Typesense](https://github.com/DAXGRID/dax-charts/tree/master/dax/typesense)
* [Tippecanoe](https://github.com/DAXGRID/dax-charts/tree/master/dax/tippecanoe)
* [Mbtileserver](https://github.com/DAXGRID/dax-charts/tree/master/dax/mbtileserver)
* [Go-http-file-server](https://github.com/DAXGRID/dax-charts/tree/master/dax/go-http-file-server)

### Aura
* [Aura-address-integrator](https://github.com/DAXGRID/dax-charts/tree/master/dax/aura-address-integrator)
* [Aura-work-integrator](https://github.com/DAXGRID/dax-charts/tree/master/dax/aura-work-integrator)
* [Aura-outage-integration](https://github.com/DAXGRID/dax-charts/tree/master/dax/aura-outage-integration)
* [Aura-csv-work-import](https://github.com/DAXGRID/dax-charts/tree/master/dax/aura-csv-work-import)
