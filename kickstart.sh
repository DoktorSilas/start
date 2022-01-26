#!/bin/sh
# CVII

echo "Project Kickstart 🚀 ..."
echo
git clone https://github.com/DoktorSilas/kickstart.git
cd kickstart
echo
echo "project folder: (Kickstart)" 
read INPUT_STRING
mv -vi ../kickstart ../$INPUT_STRING
cd ..
cd $INPUT_STRING
echo "# $INPUT_STRING" > README.md
echo "
# VSCode
.vscode/*
!.vscode/settings.json
!.vscode/tasks.json
!.vscode/launch.json
!.vscode/extensions.json
*.code-workspace
# Local History for Visual Studio Code
.history/

# Private Node Modules
node_modules/

# Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/
" > .gitignore
echo
npm init

npm -v gulp-cli
RESULT=$?
if [ $RESULT -eq 0 ]; then
  echo "gulp-cli already installed"
else
sudo npm install -g gulp-cli
fi
npm -v live-server
RESULT=$?
if [ $RESULT -eq 0 ]; then
  echo "live-server already installed"
else
npm install -g live-server
fi

npm install --save-dev gulp gulp-autoprefixer gulp-clean-css gulp-imagemin@^7.0.1 gulp-rename gulp-sass gulp-sourcemaps gulp-terser gulp-webp node-sass sass bootstrap
gulp compile
RESULT=$?
if [ $RESULT -eq 0 ]; then
  echo 
  echo "gulp runs great!"
  echo "-"
  echo "Now you have the Kickstarter Template running with gulp 🚀"
  echo "[gulp compile] compiles your scss and minify your css/js/img"
  echo "[gulp] does the same LIVE!"
  echo "-"
else
  echo
  echo "gulp not yet running :("
  echo
  echo "Now you have the Kickstarter Template 🚀"
fi
rm -rf .git
echo
code ./
git init
git add .
git commit -m "$INPUT_STRING init"
git checkout -b development
echo
echo "Done!"
live-server