# Get VPC I built in AWS console because building it by hand from scratch is more work.
```sh
aws ec2 describe-vpcs \
--filters "Name=tag:Name,Values=ethereal-nacl-test-vpc" \
--query "Vpcs[].VpcId" --output text
```

# Create NACL
```sh
aws ec2 create-network-acl --vpc-id vpc-069c284d2ba8665c1
```
# Storing acl id for later use.
# acl-083f7782442a36e04


# Get AMI for amazon linux 2
```sh
aws ec2 describe-images \
--owners amazon \
--filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" "Name=state,Values=available" "Name=free-tier-eligible,Values=true" \
--query "Images[?starts_with(Name, 'amzn2')]|sort_by(@, &CreationDate)[-1].ImageId" \
--region ca-central-1
```

# Deploy CFN template.
# I used clickops this time plz no bulli

```sh
aws ec2 create-network-acl-entry \
--network-acl-id acl-083f7782442a36e04 \
--ingress --rule-number 90 \
--protocol -1 \
--port-range From=0,To=65535 \
--cidr-block <mypublicipaddresshere>/32 \
--rule-action deny
```

# Denying access to myself to demonstrate the nacl is working