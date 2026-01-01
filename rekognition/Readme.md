aws s3 mb s3://ethereal-rekog-example2 --region us-east-1

aws s3 cp ./03stewart-review-mediumSquareAt3X.jpg s3://ethereal-rekog-example2 --region us-east-1

aws s3 rm s3://ethereal-rekog-example2/03stewart-review-mediumSquareAt3X.jpg --region us-east-1

aws s3 rb s3://ethereal-rekog-example2 --region us-east-1