#!/bin/bash

echo "Installing FreeAPS extensions..."

cd /root &&
echo "oref0-online.sh"
cp freeaps/scripts/oref0/oref0-online.sh src/oref0/bin

if [ -d  .xDripAPS ]; then
    echo "xDripAPS.py"
    cp freeaps/scripts/xDripAPS/xDripAPS.py .xDripAPS
fi
echo "All done!"
