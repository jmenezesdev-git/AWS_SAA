```sh
aws ec2 create-image --instance-id i-057bee3426a042b10 --name "MyAmi-000"
```
```sh
aws ec2 copy-image --source-region ca-central-1 --source-image-id ami-08c1448f7a88c4d1f --name "My copied AMI" --region us-east-1 --encrypted
```