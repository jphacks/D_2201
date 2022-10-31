#!/bin/bash

echo "1.Repository Update"
git pull origin master

echo "2.Build Flutter"
cd ./AwardApp
flutter build web
cp -r ./build/web/* ../../public_html/
echo "CI Complete!"