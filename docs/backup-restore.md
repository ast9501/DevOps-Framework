# Backup and restore
>With Velero
## Pre-requirement
* Minio with access credential
```
# credentials-minio
[default]
aws_access_key_id = <access-id>
aws_secret_access_key = <access-key>
```

## Install velero
Setup the velero:
- bucket: bucket on minio to store backup item
- secret-file: keep access credential
- region: your minio region
- s3Url: your minio url

```
velero install \
--provider aws \
--plugins velero/velero-plugin-for-aws:v1.5.1 \
--bucket homelab-velero \
--secret-file ./credentials-minio \
--use-restic \
--backup-location-config region=tw-hsinchu-rpi-1,s3ForcePathStyle="true",s3Url=http://192.168.113.145:9000 \
--use-volume-snapshots=false \
--default-volumes-to-restic
```

## Create backup
```
velero backup create test-photoprism-backup --include-namespaces life --wait
```
## Restore from backup
```
velero restore create --from-backup test-photoprism-backup --preserve-nodeports
```
