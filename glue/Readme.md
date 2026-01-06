aws s3 mb s3://eth-glue-data-catalog

curl https://data.wa.gov/api/views/f6w7-q2d2/rows.csv?accessType=DOWNLOAD -o vehicle.csv

aws s3 cp vehicle.csv s3://eth-glue-data-catalog/data/vehicle.csv

aws glue create-database --database-input Name=ethdatabase

# needed to make a custom role with A) S3 permissions for output and B) Glue managed service roles.

# create glue crawler
```sh
aws glue create-crawler \
--name eth-on-demand-crawler \
--role AWSGlueServiceRole-eth-crawler \
--database-name ethdatabase \
--targets '{"S3Targets": [{"Path": "s3://eth-glue-data-catalog/data/"}]}' \
--classifiers []
```

# ran crawler via clickops

# generated job via visual stuff