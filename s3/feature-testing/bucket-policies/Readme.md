# Create Bucket
aws s3 mb s3://ethereal-bucket-policy-1234


# Create Bucket Policy
aws s3api put-bucket-policy --bucket ethereal-bucket-policy-1234 --policy file://policy.json

# In the other account, access the bucket
aws s3 ls s3://ethereal-bucket-policy-1234
touch testfile.txt
aws s3 cp testfile.txt s3://ethereal-bucket-policy-1234
aws s3 ls s3://ethereal-bucket-policy-1234

# Delete Bucket
aws s3 rm s3://ethereal-bucket-policy-1234/testfile.txt
aws s3 rb s3://ethereal-bucket-policy-1234