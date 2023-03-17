#!/bin/bash

SCRIPT_DIR=`dirname "$(readlink -f "$BASH_SOURCE")"`
ROOT_DIR=$SCRIPT_DIR/shop-angular-cloudfront

CLIENT_BUILD_DIR=$ROOT_DIR/dist

ENV_CONFIGURATION="app"

cd $ROOT_DIR

npm install

npm run build --configuration $ENV_CONFIGURATION

cd ..

if [ -f $CLIENT_BUILD_DIR/client-app.zip ]; then
  rm -r $CLIENT_BUILD_DIR/client-app.zip
fi

zip -r $CLIENT_BUILD_DIR/client-app.zip $CLIENT_BUILD_DIR/app
