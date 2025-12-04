# 169.254.169.254 is a fixed value - always ussed for EC2 metadata services.

```sh
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token") \
-H "X-aws-ec2-metadata-token-ttl-seconds: 21600" \
--silent)
```
```sh
curl -H "X-aws-ec2-metadata-token: $TOKEN" \
http://169.254.169.254/latest/meta-data/security-groups \
--silent
```
# endpoint can vary, used security-groups as an example 

curl http://169.254.169.254/latest/meta-data/
# or
wget -qO - http://169.254.169.254/latest/meta-data/
# that's O not 0....oh not zero

# Require the use of IMDSv2
aws ec2 modify-instance-metadata-options \
    --instance-id i-0ef07836ce4e6452d \
    --http-tokens required \
    --http-endpoint enabled \
    --region ca-central-1

TOKEN=$(
    curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600" --silent
)

curl -H "X-aws-ec2-metadata-token: $TOKEN" \
-v http://169.254.169.254/latest/meta-data/security-groups
# No returns???


# Expected return
curl -H "X-aws-ec2-metadata-token: $TOKEN" \
-v http://169.254.169.254/latest/meta-data/