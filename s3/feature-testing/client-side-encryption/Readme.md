# initialize environment
```sh
aws s3 mb s3://ethereal-cs-encryption

```

# run encryption script
```sh
bundle exec ruby encrypt.rb
```
# Cleanup
```sh
aws s3 rm s3://ethereal-cs-encryption/hello.txt
```
```sh
aws s3 rb s3://ethereal-cs-encryption
```