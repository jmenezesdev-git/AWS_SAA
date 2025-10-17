# Create a new s3 bucket

```md
aws s3 mb s3://checksums-examples-ethereal-2222
```

# Create a file we will do a checksum on

```
echo "Hello Gensokyo" > testfile.txt
```

# Get a checksum of a file for md5
```md
md5sum testfile.txt
```
# 17b3cad9fa8bdf7d469f3905b1451a13  testfile.txt

# Upload file and look at it's etag
```
aws s3 cp testfile.txt s3://checksums-examples-ethereal-2222
aws s3api head-object --bucket checksums-examples-ethereal-2222 --key testfile.txt
```
# cksum is not usable as it generates a CRC32 based on POSIX 1003.2 but AWS uses a different polynomial as a base

```sh
sudo apt install rhash -y
rhash --crc32 --simple testfile.txt
```
# 17612004 

# Step 1: Get CRC32 hash in hex (8 hex digits)
crc32_hex=$(rhash --crc32 --simple testfile.txt)

# Step 2: Convert hex to binary
crc32_bin=$(echo "$crc32_hex" | xxd -r -p)

# Step 3: Base64 encode
base64_crc32=$(echo "$crc32_bin" | base64)

echo "Base64 CRC32: $base64_crc32"
# F2EgBA==

# all in one
```sh
b64_crc32=$(rhash --crc32 --simple testfile.txt | xxd -r -p | base64)
echo "$base64_crc32"
```


```sh
aws s3api put-object \
--bucket="checksums-examples-ethereal-2222" \
--key="testfilecrc32.txt" \
--body="testfile.txt" \
--checksum-algorithm="CRC32" \
--checksum-crc32="F2EgBA=="
```


### AWS Does not appear to use the standard SHA1 algorithm or the base 64 version of said algorithm

# generate sha1sum linux
```sh
sha1sum testfile.txt
```
# call my ruby script that does the same thing
```sh
ruby sha1_checksum.rb
```
# alternatively bundle exec ruby sha1_checksum.rb

# this is an undocumented change that 
```sh
aws s3api put-object \
--bucket="checksums-examples-ethereal-2222" \
--key="testfilesha1.txt" \
--body="testfile.txt" \
--checksum-algorithm="SHA1" \
--checksum-sha1="0e6cd6b5f6291e24475f7e5e81a90e89a12e386c"
```
# SHA1 = 0e6cd6b5f6291e24475f7e5e81a90e89a12e386c
# BASE64 of SHA1 = MGU2Y2Q2YjVmNjI5MWUyNDQ3NWY3ZTVlODFhOTBlODlhMTJlMzg2Yw==
# SHA1 -> Binary -> B64 also doesn't work


