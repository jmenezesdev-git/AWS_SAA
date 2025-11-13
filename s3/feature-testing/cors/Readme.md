# Create Website 1

# Create a Bucket
```sh
aws s3 mb s3://ethereal-cors-testing
```
# Change block public access

```sh
aws s3api put-public-access-block \
--bucket ethereal-cors-testing \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```
# Create a bucket policy
```sh
aws s3api put-bucket-policy \
--bucket ethereal-cors-testing \
--policy file://bucket-policy.json
```

# Turn on static website hosting
```sh
aws s3api put-bucket-website --bucket ethereal-cors-testing --website-configuration file://website.json
```
# Upload an index.html file and include a resource that would be cross-origin
```sh
aws s3 cp index.html s3://ethereal-cors-testing
```
# View website 
# http://ethereal-cors-testing.s3-website.ca-central-1.amazonaws.com/
# other regions may use        s3-website-ca-central-1.amazonaws.com



# Create API gateway with mock response then test the endpoint
# https://afbdrspui9.execute-api.ca-central-1.amazonaws.com/prod
# 
# Mock response example stored in hello.js
```sh
curl -X POST -H "Content-Type: application/json" https://afbdrspui9.execute-api.ca-central-1.amazonaws.com/prod/hello
```

# Apply a CORS policy
```sh
aws s3api put-bucket-cors --bucket ethereal-cors-testing --cors-configuration file://cors.json
```





# Remove bucket
aws s3 rm s3://ethereal-cors-testing/index.html
aws s3 rb s3://ethereal-cors-testing
