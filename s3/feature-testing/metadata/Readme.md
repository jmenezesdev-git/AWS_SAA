
# Make Bucket
aws s3 mb s3://ethereal-metadata-fun

# create test file
echo "Hello Gensokyo" > temp.txt

# Put object in bucket
aws s3api put-object --bucket ethereal-metadata-fun --key temp.txt --body temp.txt --metadata Location=Gensokyo

# Get object metadata
aws s3api head-object --bucket ethereal-metadata-fun --key temp.txt

# while the API returns a json object that includes "Metadata":{ "location": "Gensokyo"}, the AWS Console indicates that the key is actually "x-amz-meta-location" rather than "location" 

# Cleanup
aws s3 rm s3://ethereal-metadata-fun/temp.txt
aws s3 rb s3://ethereal-metadata-fun
