
aws logs create-log-group --log-group-name eth-cloudtrail



# Working with the Cloudtrail from basic. Didn't delete

```sh
aws cloudtrail update-trail \
--name ethereal-trail \
--cloud-watch-logs-log-group-arn arn:aws:logs:ca-central-1:169634835787:log-group:eth-cloudtrail:* \
--cloud-watch-logs-role-arn arn:aws:iam::169634835787:role/ethCloudTrail2CLoudWatchRole
```

