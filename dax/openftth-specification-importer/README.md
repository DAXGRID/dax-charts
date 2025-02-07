# OpenFTTH Specification Importer

## Default example

```sh
helm upgrade specification-importer dax/openftth-specification-importer \
    --install \
    -n my-namespace \
    --set "specifications[0].name=my_specification_one.json" \
    --set-file "specifications[0].value=/home/my_user/my_specification_one.json" \
    --set "specifications[1].name=my_specification_two.json" \
    --set-file "specifications[1].value=/home/my_user/my_specification_two.json"
```

## Execute script example

In case other things need to happen, you can define a custom execute script.

```sh
helm upgrade specification-importer dax/openftth-specification-importer \
    --install \
    -n my-namespace \
    --set-file "executeScript=/home/my_user/my_execute_script.sh" \
    --set "specifications[0].name=my_specification_one.json" \
    --set-file "specifications[0].value=/home/my_user/my_specification_one.json" \
    --set "specifications[1].name=my_specification_two.json" \
    --set-file "specifications[1].value=/home/my_user/my_specification_two.json"
```
