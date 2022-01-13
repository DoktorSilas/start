#!/bin/sh
# CVII

echo "Project Kickstart 🚀 ..."
echo
git clone https://github.com/DoktorSilas/kickstart.git
cd kickstart
echo
npm init
npm install --save-dev gulp gulp-autoprefixer gulp-clean-css gulp-imagemin@^7.0.1 gulp-rename gulp-sass gulp-sourcemaps gulp-terser gulp-webp node-sass sass 
gulp compile
RESULT=$?
if [ $RESULT -eq 0 ]; then
  echo 
  echo "gulp runs great!"
  echo "-"
  echo "Now you have the kickstarter template running gulp 🚀"
  echo "[gulp compile] compiles your scss and minify your css/js/img"
  echo "[gulp] does the same LIVE!"
  echo "-"
else
  echo
  echo "gulp not yet running :("
  echo
  echo "Now you have the kickstarter template 🚀"
fi
rm -rf .git
echo
git init
code ./
echo
echo "Done!"