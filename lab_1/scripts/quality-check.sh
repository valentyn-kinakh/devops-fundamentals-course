#!/bin/bash

SCRIPT_DIR=$(dirname "$(readlink -f "$BASH_SOURCE")")
ROOT_DIR=$SCRIPT_DIR/shop-angular-cloudfront

CLIENT_BUILD_DIR=$ROOT_DIR/dist

cd $ROOT_DIR


npm run lint
if [ $? -eq 0 ]; then
    echo OK
else
    echo FAIL
    exit
fi

npm run test
if [ $? -eq 0 ]; then
    echo OK
else
    echo FAIL
    exit
fi

npm run e2e
if [ $? -eq 0 ]; then
    echo OK
else
    echo FAIL
    exit
fi
