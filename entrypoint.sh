#!/bin/bash

echo "1.Repository Update"
git checkout master
git fetch origin master
git reset --hard origin/master

echo "2.Build Flutter"
cd ./AwardApp
flutter build web
cp -r ./build/web/* /var/www/html
echo "CI Complete!"