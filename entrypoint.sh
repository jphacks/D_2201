#!/bin/bash

echo "1.Repository Update"
git reset --hard

echo "2.Build Flutter"
cd ./AwardApp
flutter build web
cp -r ./build/web/* /var/www/html
echo "CI Complete!"