#!/bin/bash
# set -e
set -x

echo "TEST SCRIPT BEGIN"

ceph -s

ceph osd pool create testpool 40

rbd pool init testpool

rbd create testpool/testimage --size 100

rbd device map testpool/testimage --id root

ls /dev/rbd/testpool

rbd device list

rbd info testpool/testimage

mkfs.ext4 -m0 /dev/rbd/testpool/testimage

mkdir -p /mnt/testimage

mount /dev/rbd/testpool/testimage /mnt/testimage

rbd rm testpool/testimage

echo "TEST SCRIPT END"
