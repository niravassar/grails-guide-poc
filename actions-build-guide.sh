#!/bin/bash
set -e


echo "*****************************************"
export EXIT_STATUS=0

curl -O https://raw.githubusercontent.com/grails/grails-guides/master/travis/build-guide
chmod 777 build-guide

echo "************** PRINTING **************"
cat build-guide
echo "************** pwd *******************"
pwd
ls -al
