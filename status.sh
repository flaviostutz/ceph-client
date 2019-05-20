#!/bin/bash
set -e
# set -x

kv=$(uname -r)
vc=$(semver compare $kv 4.5.2)
if [ "$vc" == "-1" ]; then
    echo "The Linux host kernel version must be greater or equal 4.5.2. current version=$kv"
    exit 1
fi

echo "This is a sample script. Extend this image and create a startup.sh script that calls './initialize.sh' for the client to be setup'."

ceph -w&

while true; do
    echo "====CEPH STATUS===="
    ceph health detail
    ceph status
    echo "==================="
    sleep 5
done

