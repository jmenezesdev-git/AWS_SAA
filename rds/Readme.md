# Create Secret
```sh
aws secretsmanager create-secret \
--name MyRdsPassword \
--secret-string "{\"password\":\"mypassword\"}" \
--description "AWS RDS Postgres Secret made via CLI"
```

# run deploy script, approve changes

# to test

# create EC2 instance - nothing crazy
# add default security group
# connect via session manager

# install
# sudo dnf install postgresql17.x86_64 postgresql17-server -y
# postgresql://ethereal:mypassword@rds-basic-rdsinstance-resbugikm0dl.cpyaei8ycqvb.ca-central-1.rds.amazonaws.com:5432/ethdatabase
#