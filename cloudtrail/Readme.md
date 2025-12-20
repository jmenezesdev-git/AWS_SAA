# need a bucket to create a trail
```sh
aws s3 mb s3://eth-cloudtrail
```

# need a bucket policy, documentation has one for S3/Cloudtrail so that's not too hard
```sh
aws s3api put-bucket-policy \
--bucket eth-cloudtrail \
--policy file://policy.json
```

```sh
aws cloudtrail create-trail \
--name ethereal-trail \
--s3-bucket-name eth-cloudtrail
--region ca-central-1
```
```sh
aws cloudtrail start-logging --name ethereal-trail
```
