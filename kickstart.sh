#!/bin/sh
# CVII

echo "Project Kickstart 🚀 ..."
echo
git clone https://github.com/DoktorSilas/kickstart.git
cd kickstart
npm init
npm install --save-dev gulp@4.0.2 gulp-autoprefixer@8.0.0 gulp-clean-css@4.3.0 gulp-imagemin@7.0.1 gulp-rename@2.0.0 gulp-sass@5.0.0 gulp-sourcemaps@3.0.0 gulp-terser@2.1.0 gulp-webp@4.0.1 node-sass sass 
rm -rf .git

code ./
echo
echo "Done! 🚀"