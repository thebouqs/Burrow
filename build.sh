#!/bin/bash

ENV=$1
VERSION=$2

if [ -z $ENV ]; then
    echo
    echo "Usage: build.sh 'prod | stg' \$VERSION (optional)"
    echo "If \$VERSION is not supplied it will be set to \$ENV"
    echo
    echo "Output:"
    echo "  Builds - burrow:\$ENV"
    echo "  Tags - 128549080477.dkr.ecr.us-east-1.amazonaws.com/burrow:\$ENV"
    echo
    exit 0
fi

if [ -z $VERSION ]; then
    VERSION=$ENV
fi

$(aws ecr get-login --no-include-email --region us-east-1)
echo docker build -f Dockerfile.$ENV -t burrow:$VERSION .
echo docker tag burrow:$VERSION 128549080477.dkr.ecr.us-east-1.amazonaws.com/burrow:$VERSION
echo docker push 128549080477.dkr.ecr.us-east-1.amazonaws.com/burrow:$VERSION
