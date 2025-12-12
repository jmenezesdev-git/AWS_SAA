aws s3 mb s3://eth-src-vid-123434

aws s3 mb s3://eth-dest-vid-123434

aws s3 cp App2Container.mp4 s3://eth-src-vid-123434/input/App2Container.mp4

aws s3 cp none.txt s3://eth-dest-vid-123434/output/none.txt

# Made job in aws console - MediaConvert

aws s3 rm s3://eth-src-vid-123434/input/App2Container.mp4
aws s3 rm s3://eth-dest-vid-123434/output/App2Container.mp4
aws s3 rm s3://eth-dest-vid-123434/output/none.txt
aws s3 rb s3://eth-src-vid-123434
aws s3 rb s3://eth-dest-vid-123434