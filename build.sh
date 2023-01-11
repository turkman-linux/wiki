#!/bin/sh
rm -rf build
make html
find build/html -type f -iname *.html -exec sed -i "s/.*src=\".*\.js\".*//g" {} \;
find build/html -type f -iname *.js -exec rm -rf {} \;
rm -rf build/html/_static/css