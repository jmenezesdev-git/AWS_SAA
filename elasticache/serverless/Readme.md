# Create serverless redis cache

aws elasticache create-serverless-cache --serverless-cache-name eth-cache-dev --engine redis --major-engine-version 7

# needed to install redis
# they don't like windows T.T
# thank god for wsl but still awkward
# https://redis.io/docs/latest/operate/oss_and_stack/install/archive/install-redis/install-redis-on-windows/

# wsl redis-cli
# ^^ works to invoke redis from outside wsl

# wrote up cfn template for ec2 instance, copied from VPC/nacl/template/yaml