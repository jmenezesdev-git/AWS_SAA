# need a role arn. Made a role using clickops, used index policy.json from...
# https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html#iam-roles-index
# no clue if that's the right one but I also made the principal for the role kendra.amazonaws.com

# Creating index. Some AI/ML tools are region locked so I used us-east-1
```sh
aws kendra create-index \
--name eth-index \
--role-arn arn:aws:iam::169634835787:role/Eth_KendraIndexRole \
--edition DEVELOPER_EDITION \
--description "Eth Index" \
--region us-east-1
```

# need a bucket
```sh
aws s3 mb s3://eth-kendra-bucket --region us-east-1
```

# upload text-pdf that has been split
```sh
aws s3 sync . s3://eth-kendra-bucket --region us-east-1
```
# cd d:Docs/SplitIA




# create data source
```sh
aws kendra create-data-source \
--index-id b52362dc-1ed9-4495-940e-0fec5d478543 \
--name eth-data-source \
--role-arn arn:aws:iam::169634835787:role/Eth_KendraDataSourceRole \
--type S3 \
--configuration '{"S3Configuration":{"BucketName": "eth-kendra-bucket"}}' \
--region us-east-1
```

# start sync job
```sh
aws kendra start-data-source-sync-job \
--index-id b52362dc-1ed9-4495-940e-0fec5d478543 \
--id 9fe51497-7930-41dd-8389-9a16a24214c4 \
--region us-east-1
```

# Query

```sh
aws kendra query \
--index b52362dc-1ed9-4495-940e-0fec5d478543 \
--query-text "Where is the unit profile for the Hornet?" \
--region us-east-1
```

```sh
aws kendra query \
--index b52362dc-1ed9-4495-940e-0fec5d478543 \
--query-text "Where is the unit profile for the Hierophant Bio Titan?" \
--region us-east-1
```

```sh
aws kendra query \
--index b52362dc-1ed9-4495-940e-0fec5d478543 \
--query-text "What units are available for the Asuryani?" \
--region us-east-1
```