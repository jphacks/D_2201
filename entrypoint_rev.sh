#!/bin/bash

echo "1.Repository update and Set at codefreeze"
git checkout master
git fetch origin master
git reset --hard origin/master
git checkout 0505d036b3c14ce67570e27642216eb568e6c313

echo "2.Build Flutter"
cd ./AwardApp
flutter build web
cp -r ./build/web/* /var/www/html
cp -r /var/www/html/assets/assets/* /var/www/html/assets/
echo "CI Complete!"