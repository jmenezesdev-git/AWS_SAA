# Create User with no permissions
```sh
aws iam create-user --user-name sts-machine-user
aws iam create-access-key --user-name sts-machine-user --output table
```

# copy access key and secret into first fields for
```sh
aws configure
```
# Edit to change away from default profile
# go to ~/.aws/credentials or %USERPROFILE%/.aws/credentials and change [default] to [sts] 

# Test who I am
```sh
aws sts get-caller-identity --profile sts
```
# Verify identity/profile use is working
```sh
aws s3 ls
```
# Should receive AccessDenied error

# Create role to access new resource 
# don't forget chmod u+x bin/deploy if running in WSL or Linux, git bash automatically gives x to bash files
```sh
./bin/deploy
```
```sh
aws iam put-user-policy \
    --user-name sts-machine-user \
    --policy-name StsAssumePolicy \
    --policy-document file://policy.json
```
# Use new credentials and assume role
```sh
aws sts assume-role \
    --role-arn arn:aws:iam::169634835787:role/ethereal-sts-stack-StsRole-dyZA1LsQfLbl \
    --role-session-name s3-sts-fun \
    --profile sts
```
# use return values to populate new profile in credentials file.
# in this case I named it assumed



# Test who I am
```sh
aws sts get-caller-identity --profile assumed
```

```sh
aws s3 ls --profile assumed
```

# To cleanup first delete the Cloudformation stack via the AWS mgmt console
# then delete iam machine user by first deleting associated user policy and access key
# could this be done via cloudformation? Probably.
```sh
aws iam delete-user-policy \
    --user-name sts-machine-user \
    --policy-name StsAssumePolicy

aws iam delete-access-key \
    --user-name sts-machine-user \
    --access-key-id AKIASO7YGFVF4UERZSVX

aws iam delete-user --user-name sts-machine-user
```
