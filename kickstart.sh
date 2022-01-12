#!/bin/sh
# CVII

echo "Project Kickstart 🚀 ..."
echo
git clone https://github.com/DoktorSilas/kickstart.git
cd kickstart
code ./
npm install
rm -rf .git
echo
echo "Done! 🚀"