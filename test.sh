#!/bin/bash
# set -e
set -x

echo "TEST SCRIPT BEGIN"

ceph -s

ceph osd pool create testpool 40

rbd pool init testpool

rbd create testpool/testimage --size 100

rbd --image testpool/testimage info

rbd feature disable testpool/testimage object-map fast-diff deep-flatten

rbd device map testpool/testimage --id admin

ls /dev/rbd*

rbd device list

mkfs.ext4 -m0 /dev/rbd0

mkdir -p /mnt/testimage

mount /dev/rbd0 /mnt/testimage

echo "testing a lot!" >> /mnt/testimage/test.txt
echo "testing a lot!" >> /mnt/testimage/test.txt
echo "testing a lot!" >> /mnt/testimage/test.txt

umount /mnt/testimage

rbd rm testpool/testimage

echo "TEST SCRIPT END"

