#!/bin/bash
set -e
# set -x

echo "This is a sample script. Extend this image and create a startup.sh script that calls './initialize.sh' for the client to be setup'."

ceph -w&

while true; do
    echo "====CEPH STATUS===="
    ceph health detail
    ceph status
    echo "==================="
    sleep 5
done

