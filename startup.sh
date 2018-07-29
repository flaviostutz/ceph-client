#!/bin/bash
set -e
# set -x

echo "Calling 'initialize.sh'..."
./initialize.sh

echo "This is a sample script. Extend this image and create a startup.sh script that calls './initialize.sh' for the client to be setup'."

while true; do
    echo ""
    echo "--CEPH STATUS--"
    ceph -s
    sleep 2
done

