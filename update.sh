#!/bin/bash

echo "Installing FreeAPS extensions..."

echo "Updating oref0..."
cd ~/src/oref0 &&
if git branch | grep "* master"; then
    git checkout master && git stash && git pull
else
    git checkout dev && git stash && git pull
fi
git stash drop

cd /root &&
echo "Patching files..."
echo "oref0-online.sh"
cp freeaps/scripts/oref0/oref0-online.sh src/oref0/bin

if [ -d  .xDripAPS ]; then
    echo "xDripAPS.py"
    cp freeaps/scripts/xDripAPS/xDripAPS.py .xDripAPS
fi

echo "Rebuilding oref0..."
cd /root/src/oref0
if git branch | grep "* master"; then
	npm install -g oref0
else
	npm run global-install
fi

echo "All done!"

