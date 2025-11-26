# Made cfn template

# Deploying
```sh
export STACK_NAME="ethereal-sg-stack"
export CHANGESET_NAME="ethereal-sg-changeset"
```

```sh
aws cloudformation deploy \
--template-file template.yaml \
--no-execute-changeset \
--region ca-central-1 \
--stack-name $STACK_NAME \
--capabilities CAPABILITY_IAM
--change-set-name $CHANGESET_NAME
```

```sh
aws cloudformation execute-change-set \
    --change-set-name $CHANGESET_NAME \
    --stack-name $STACK_NAME
```

# Was playing around with default Security group for new stack in AWS Console

# Blow up the stack
```sh
aws cloudformation delete-stack \
--stack-name $STACK_NAME
```