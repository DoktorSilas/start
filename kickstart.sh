#!/bin/sh
# CVII

echo "Project Kickstart 🚀 ..."
echo
git clone https://github.com/DoktorSilas/start.git
cd start
code ./
npm install
rm -rf .git
echo
echo "Done! 🚀"