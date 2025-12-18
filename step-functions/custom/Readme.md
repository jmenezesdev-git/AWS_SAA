# need a bucket
```sh
aws s3 mb s3://eth-gensokyo
```
# need a way to collect data and trigger events
# enabling EventBridge
```sh
aws s3api put-bucket-notification-configuration \
--bucket eth-gensokyo \
--notification-configuration '
{
    "EventBridgeConfiguration": {
  }
}
'
```

# State function
```sh
aws stepfunctions create-state-machine \
--name eth-gsy-stepfunctions \
--role-arn arn:aws:iam::169634835787:role/eth-stepfunctions \
--definition '
{
  "Comment": "A Hello World example of the Amazon States Language using a Pass state",
  "StartAt": "HelloWorld",
  "States": {
    "HelloWorld": {
      "Type": "Pass",
      "Result": "Hello World!",
      "End": true
    }
  }
}
'
```

# OutputPath and Result appear to be mutually exclusive

# upload files after creating eventbridge
# event bridge uses S3 Create object with a bucket filter set to this file's bucket
# target is the Step Function we just made via cli

```sh
aws s3 cp TH20Reimu.png s3://eth-gensokyo/Th20Reimu.png
```

# https://docs.aws.amazon.com/AmazonS3/latest/userguide/ev-events.html

# After an hour of troubleshooting it turns out ca-central-1 doesn't support Rekognition
# time to rebuild everything in us-east-1
```sh
aws s3 mb s3://eth-gensokyo --region us-east-1

aws s3api put-bucket-notification-configuration \
--bucket eth-us-east-1-123321 \
--notification-configuration '
{
    "EventBridgeConfiguration": {
  }
}
'
```

# need to add a bucket policy to allow access 



# got things working in US East 1 after a buch of fiddling in the console.