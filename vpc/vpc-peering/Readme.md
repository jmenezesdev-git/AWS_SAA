# Created 2 vpcs, subnet, rts in the console because clickops saves me a bit of time and I don't have to manually create the subobjects


aws ec2 create-vpc-peering-connection --vpc-id vpc-069ce4bd91161cc6b --peer-vpc-id vpc-00ca5316972426917

# pcx-0fe2338850ecfe82a  --- peering connection id for my new connection

aws ec2 accept-vpc-peering-connection --vpc-peering-connection-id pcx-0fe2338850ecfe82a

# rtb a -> rtb b's cidr block w/vpc peering id
aws ec2 create-route --route-table rtb-0e47ed9a44632d534 --destination-cidr-block 10.1.0.0/16 --vpc-peering-connection-id pcx-0fe2338850ecfe82a

# rtb b -> rtb a's cidr block with vpc peering id
aws ec2 create-route --route-table rtb-03da60aaab39d22e4 --destination-cidr-block 10.0.0.0/16 --vpc-peering-connection-id pcx-0fe2338850ecfe82a

# Built a couple of simple stacks - one for a simple webserver, the other for a box that can connect to it to verify peering
# see the template.yaml files - build them in cloudformation

# connect to instance A
# use wget -qO - <b public url> to verify internet connection 
# use wget -qO - <b private url> to verify peered connection 
# delete internet connection
aws ec2 delete-route --route-table rtb-03da60aaab39d22e4 --destination-cidr-block 0.0.0.0/0

# use wget -qO - <b public url> to verify abscence of internet connection 
# use wget -qO - <b private url> to verify presence of peered connection 