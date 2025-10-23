
# Make Bucket
aws s3 mb s3://ethereal-storage-class-fun

# create test file
echo "Hello Gensokyo" > temp.txt

# Put object in bucket
aws s3api put-object --bucket ethereal-storage-class-fun --key temp.txt --body temp.txt --storage-class STANDARD_IA
# Can just call function again with --storage-class argument to update file.
# Default is STANDARD


# Cleanup
aws s3 rm s3://ethereal-storage-class-fun/temp.txt
aws s3 rb s3://ethereal-storage-class-fun
