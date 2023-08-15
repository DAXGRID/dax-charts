# Notification file change trigger

Chart for notification file change trigger [link.](https://github.com/DAXGRID/notification-file-change-trigger)

Shows an example of injecting a file named `example.sh`. The file-system path will always be `/home/app/files/{my-file-name}`. It is not required to inject a script, a simple command can also just be called (see `values.yaml` file).

```sh
helm upgrade notification-file-change-trigger ./dax/notification-file-change-trigger \
  --install \
  -n my-namespace \
  --set "files[0].name=example.sh" \
  --set-file "files[0].value=/home/myuser/example.sh"
```
