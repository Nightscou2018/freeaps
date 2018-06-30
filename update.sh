#!/bin/bash

echo "Installing FreeAPS extensions..."

echo "Updating oref0..."
if git branch | grep "* master"; then
    cd ~/src/oref0 && git checkout master && git pull
else
    cd ~/src/oref0 && git checkout dev && git pull
fi

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
