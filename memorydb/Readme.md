# https://docs.aws.amazon.com/id_id/cli/latest/reference/memorydb/index.html#cli-aws-memorydb
# need a user grant access to via the acl

aws memorydb create-user \
    --user-name ethereal \
    --access-string "on ~* +@all" \
     --authentication-mode \
         Passwords="FakePassword1234!",Type=password


# need an acl and subnet group to make the cluster

aws memorydb create-acl \
    --acl-name "eth-memdb-acl" \
    --user-names "ethereal"


aws memorydb create-subnet-group \
    --subnet-group-name eth-subnet-group \
    --description "eth-subnet-group" \
    --subnet-ids subnet-0a1e98c3057178771 subnet-0bf74a01123a12e63


# apparently we need 2+ AZs in all subnet groups for memdb
<!-- aws memorydb delete-subnet-group \
    --subnet-group-name eth-subnet-group -->

# Create Cluster
```sh
aws memorydb create-cluster \
    --cluster-name eth-memdb-cluster2 \
    --node-type db.t4g.small \
    --acl-name eth-memdb-acl \
    --subnet-group eth-subnet-group
```
# AZ error suggested that some AZs or subnets on those AZs have limited capacity but I tore everything down so idk.
# ran into some issues with default vpc, trying again with custom vpc.

# commands to information & events related to cluster
aws memorydb describe-events --source-name eth-memdb-cluster2 --source-type cluster
aws memorydb describe-clusters