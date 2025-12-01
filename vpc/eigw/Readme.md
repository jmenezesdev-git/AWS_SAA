aws ec2 create-vpc --cidr-block 10.0.0.0/16 --amazon-provided-ipv6-cidr-block

aws ec2 create-subnet --vpc-id vpc-0ecc2de5d60ceeade --ipv6-cidr-block 2600:1f11:ba1:5b00::/64 --cidr-block 10.0.2.0/24

# vpc-0ecc2de5d60ceeade
# ipv6 cidr block 2600:1f11:ba1:5b00::/56

# subnet-037b4dd214f2475e1

aws ec2 modify-subnet-attribute --subnet-id subnet-037b4dd214f2475e1 --enable-dns64

aws ec2 create-egress-only-internet-gateway --vpc-id vpc-0ecc2de5d60ceeade

# eigw-08db25c83b17ab505

aws ec2 create-internet-gateway

# igw-0731b5299d5e52dfe

aws ec2 attach-internet-gateway --internet-gateway-id igw-0731b5299d5e52dfe --vpc-id vpc-0ecc2de5d60ceeade

aws ec2 allocate-address

#    "AllocationId": "eipalloc-0d5df25277a516559",


aws ec2 create-nat-gateway --subnet-id subnet-037b4dd214f2475e1 --allocation-id eipalloc-0d5df25277a516559

# nat-0952bb61fc2049a12

aws ec2 create-route-table --vpc-id vpc-0ecc2de5d60ceeade

# rtb-0d20cd888a27326cc

aws ec2 create-route --route-table-id rtb-0d20cd888a27326cc --destination-ipv6-cidr-block ::/0 --egress-only-internet-gateway-id eigw-08db25c83b17ab505

# 64:ff9b::/96 is a unique ipv6 address used for ipv6 to ipv4 address translation
aws ec2 create-route --route-table-id rtb-0d20cd888a27326cc --destination-ipv6-cidr-block 64:ff9b::/96 --nat-gateway-id nat-0952bb61fc2049a12

aws ec2 create-route --route-table-id rtb-0d20cd888a27326cc --gateway-id igw-0731b5299d5e52dfe --destination-cidr-block 0.0.0.0/0

aws ec2 associate-route-table --route-table-id rtb-0d20cd888a27326cc --subnet-id subnet-037b4dd214f2475e1

# suddenly need an iam-instance profile... let's make that

aws iam create-role --role-name eth-SSMAutomationRole --assume-role-policy-document file://ssm-trust-policy.json


aws iam attach-role-policy --role-name eth-SSMAutomationRole --policy-arn arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore
<!-- aws iam attach-role-policy --role-name eth-SSMAutomationRole --policy-arn arn:aws:iam::aws:policy/service-role/AmazonSSMAutomationRole -->

aws iam create-instance-profile --instance-profile-name eth-SSMAutomationInstanceProfile

aws iam add-role-to-instance-profile --role-name eth-SSMAutomationRole --instance-profile-name eth-SSMAutomationInstanceProfile

# eth-SSMAutomationInstanceProfile



#

```sh
aws ec2 run-instances --image-id ami-09e7fb5d565f22127 \
--instance-type t2.micro \
--count 1 \
--iam-instance-profile Name=eth-SSMAutomationInstanceProfile \
--network-interfaces DeviceIndex=0,Ipv6AddressCount=1,SubnetId=subnet-037b4dd214f2475e1,AssociatePublicIpAddress=true
```
# i-00f51e1eea0549119

# 52.60.44.0
# 2600:1f11:ba1:5b00:be9b:9245:d25b:fc70

aws ec2 terminate-instances --instance-ids i-00f51e1eea0549119

# need to delete dependencies for RT
aws ec2 describe-route-tables --route-table-ids rtb-0d20cd888a27326cc

# rtbassoc-0ebe6d827edab359c
aws ec2 disassociate-route-table --association-id rtbassoc-0ebe6d827edab359c

aws ec2 delete-route-table --route-table-id rtb-0d20cd888a27326cc

aws ec2 delete-nat-gateway --nat-gateway-id nat-0952bb61fc2049a12

aws ec2 release-address --allocation-id eipalloc-0d5df25277a516559

# igw has dependencies too - it's attached vpc
aws ec2 detach-internet-gateway --internet-gateway-id igw-0731b5299d5e52dfe --vpc-id vpc-0ecc2de5d60ceeade
aws ec2 delete-internet-gateway --internet-gateway-id igw-0731b5299d5e52dfe

aws ec2 delete-egress-only-internet-gateway --egress-only-internet-gateway-id eigw-08db25c83b17ab505

aws ec2 delete-subnet --subnet-id subnet-037b4dd214f2475e1

aws ec2 delete-vpc --vpc-id vpc-0ecc2de5d60ceeade