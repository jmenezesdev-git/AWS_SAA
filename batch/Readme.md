# first login to ecr after making a repo - push command is where you get this command.
aws ecr get-login-password --region ca-central-1 | docker login --username AWS --password-stdin 169634835787.dkr.ecr.ca-central-1.amazonaws.com

# Build Image

docker build -t app .

docker build -t square .

docker tag square:latest 169634835787.dkr.ecr.ca-central-1.amazonaws.com/square:latest

docker push 169634835787.dkr.ecr.ca-central-1.amazonaws.com/square:latest

# Register

aws batch register-job-definition \
--job-definition-name square-job3 \
--type container \
--container-properties '{
    "image": "169634835787.dkr.ecr.ca-central-1.amazonaws.com/square",
    "resourceRequirements": [
        { "type": "VCPU", "value": "1" },
        { "type": "MEMORY", "value": "2048" }
    ],
    "executionRoleArn": "arn:aws:iam::169634835787:role/eth_Batch_role",
    "jobRoleArn": "arn:aws:iam::169634835787:role/eth_Batch_role",
    "networkConfiguration": {
      "assignPublicIp": "ENABLED"
    }
}' \
--platform-capabilities FARGATE


# create computer env
<!-- aws batch create-compute-environment --compute-environment-name eth-compute-env \
--type MANAGED \
--compute-resources minvCpus=0,desiredvCpus=1,maxvCpus=1,instanceTypes=m4.16xlarge,subnets=subnet-12345678,securityGroupIds=sg-12345678 \
--service-role arn:aws:iam::123456789012:role/service-role/AWSServiceRoleForBatch -->


<!-- --cli-input-json LowPriority.json \ -->

# changed to using Console & Fargate instead of EC2 as I wasn't clear what was wrong and AWS wasn't allowing the use of small machinges - asking for minimum m4 xlarges

# create queue
aws batch create-job-queue \
--job-queue-name eth-job-queue \
--state ENABLED \
--priority 1 \
--compute-environment-order order=1,computeEnvironment=arn:aws:batch:ca-central-1:169634835787:compute-environment/EthComputeEnv

# Submit Job

aws batch submit-job \
--job-name eth-job \
--job-definition square-job3 \
--job-queue eth-job-queue


# That was a bit of a mess. found out I needed

#    "networkConfiguration": {
#      "assignPublicIp": "ENABLED"
#    }

# in the job definitions file to make it work. PAIN

# Cleaned up in console because it was a bit of a mess.

# needed a custom role with one or both of: 
# AmazonECSTaskExecutionRolePolicy
# AWSBatchServiceRole

# and
# updated trust policy of
<!-- # {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": [
                    "ecs-tasks.amazonaws.com",
                    "batch.amazonaws.com"
                ]
            },
            "Action": "sts:AssumeRole"
        }
    ] -->

# also tweaked Security group to allow HTTPS output traffic. Should probably create a new VPC for this next time.

aws ecr delete-repository \
    --repository-name square \
    --force

docker rmi 169634835787.dkr.ecr.ca-central-1.amazonaws.com/square:latest
docker rmi square:latest