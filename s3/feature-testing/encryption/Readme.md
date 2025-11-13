# Create a bucket, file and upload to S3

aws s3 mb s3://ethereal-encryption-testing

echo "Hello Gensokyo" > hello.txt

# Put object with SS3-S3 (default) encryption
aws s3 cp hello.txt s3://ethereal-encryption-testing
# Cleanup file
aws s3 rm s3://ethereal-encryption-testing/hello.txt

# Can use "aws s3api head-object ..." to get information about encryption status of object
# Also given information when downloading via "get-object". "get-object-attributes" does not include encryption status.

# Put object with KMS encryption

aws s3api put-object \
--bucket ethereal-encryption-testing \
--key hello.txt \
--body hello.txt \
--server-side-encryption "aws:kms" \
--ssekms-key-id $SSE_KMS_KEY_ID

# Key can be found by using "aws kms list-keys" and "aws kms describe-key --key-id abc123..."
# do the usual export SSE_KMS_KEY_ID="MYKEYHERE"

# Download to test
aws s3 cp s3://ethereal-encryption-testing/hello.txt hellodl.txt

# Cleanup file
aws s3 rm s3://ethereal-encryption-testing/hello.txt

# Put Object with SSE-C encryption 
# AWS' encryption stuff is extremely poorly explained. The following code doesn't work. need new options
<!-- export BASE64_ENCODED_KEY=$(openssl rand 32 | base64)
echo $BASE64_ENCODED_KEY

export MD5_VALUE=$(echo -n $BASE64_ENCODED_KEY | base64 --decode | md5sum | awk '{print $1}' | base64)
echo $MD5_VALUE

aws s3api put-object \
--bucket ethereal-encryption-testing \
--key hello.txt \
--body hello.txt \
--sse-customer-algorithm AES256 \
--sse-customer-key $BASE64_ENCODED_KEY \
--sse-customer-key-md5 $MD5_VALUE -->


# gen key
openssl rand -out ssec.key 32
# put object into s3
aws s3 cp hello.txt s3://ethereal-encryption-testing/hello.txt --sse-c AES256 --sse-c-key fileb://ssec.key

# download object
aws s3 cp s3://ethereal-encryption-testing/hello.txt hello_dl.txt --sse-c AES256 --sse-c-key fileb://ssec.key


# Cleanup file and bucket
aws s3 rm s3://ethereal-encryption-testing/hello.txt
aws s3 rb s3://ethereal-encryption-testing