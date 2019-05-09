VERSION=$1
$(aws ecr get-login --no-include-email --region us-east-1)
docker build -t burrow:$VERSION .
docker tag burrow:$VERSION 128549080477.dkr.ecr.us-east-1.amazonaws.com/burrow:$VERSION
docker push 128549080477.dkr.ecr.us-east-1.amazonaws.com/burrow:$VERSION
