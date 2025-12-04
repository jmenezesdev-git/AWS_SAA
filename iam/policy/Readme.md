# Convert to json

```sh
yq -o json policy.yml > policy.json
```

# use ./convert instead. bit faster.

# Making IAM policy. Using IAM testing profile since I gave it sts and iam permissions
```sh
aws iam create-policy \
    --policy-name ethereal-test-policy \
    --policy-document file://policy.json \
    --profile aws-iam-testing
```

```sh
aws iam attach-user-policy \
--policy-arn arn:aws:iam::169634835787:policy/ethereal-test-policy \
--user-name aws-iam-testing \
--profile aws-iam-testing
```

```sh
aws s3 ls --profile aws-iam-testing
```

```sh
aws iam create-policy-version \
--policy-arn arn:aws:iam::169634835787:policy/ethereal-test-policy \
--policy-document file://policy.json \
--set-as-default \
--profile aws-iam-testing
```

```sh
aws iam delete-policy-version \
--policy-arn arn:aws:iam::169634835787:policy/ethereal-test-policy \
--version-id v5 \
--profile aws-iam-testing
```


# Check the contents
```sh
aws s3 ls s3://ethereal-test-ab-1234 --profile aws-iam-testing
```