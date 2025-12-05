
# Generate a new key
```sh
ssh-keygen -t rsa -f ec2connect
```

# set to readonly (user only, everyone else nothing)
```sh
chmod 400 ./ec2connect
```

# upload ssh key to instance
```sh
aws ec2-instance-connect send-ssh-public-key \
    --instance-id i-02a99f38713bed788 \
    --instance-os-user ec2-user \
    --availability-zone ca-central-1a \
    --ssh-public-key file://ec2connect.pub
```

# connect to instance via ssh
# uses public IP address of ec2 instance - this file is safe to commit since the instance was terminated before commit.
```sh
ssh -i ec2connect ec2-user@xxx.xxx.xxx.xxx
```