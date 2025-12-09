# Create buckets
```sh
aws s3 mb s3://source-datasync-123124

aws s3 mb s3://dest-datasync-132478
```
# upload source data to bucket
```sh
touch hello.txt
aws s3 cp hello.txt s3://source-datasync-123124
```

# used Datasync task to transfer from source to dest