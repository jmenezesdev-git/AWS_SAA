# Create a bucket
```sh
aws s3api create-bucket --bucket ethereal-acl-play --region ca-central-1 --create-bucket-configuration="LocationConstraint=ca-central-1"
```

# Turn off Block Public access for ACLs
```sh
aws s3api put-public-access-block \
    --bucket ethereal-acl-play \
    --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"
```

# Change bucket ownerhsip 
```sh
aws s3api put-bucket-ownership-controls \
    --bucket ethereal-acl-play \
    --ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"
```

# Change ACLS to provide permissions for a user in another AWS account

```sh
aws s3api put-bucket-acl \
--bucket ethereal-acl-play \
--access-control-policy="file:///s3/feature-testing/acls/policy.json"
```

# Access bucket from another account

```sh
touch testfile.txt
aws s3 cp testfile.txt s3://ethereal-acl-play
aws s3 ls s3://ethereal-acl-play
```

# Cleanup

```sh
aws s3 rm s3://ethereal-acl-play/testfile.txt
aws s3 rb s3://ethereal-acl-play
```