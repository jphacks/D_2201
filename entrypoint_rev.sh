#!/bin/bash

echo "1.Repository update and Set at codefreeze"
git checkout master
git fetch origin master
git reset --hard origin/master
git checkout 30dd5efc2ac094b4b5034cf9db7b1d9e8eb12306

echo "2.Build Flutter"
cd ./AwardApp
flutter build web
cp -r ./build/web/* /var/www/html
cp -r /var/www/html/assets/assets/* /var/www/html/assets/
echo "CI Complete!"