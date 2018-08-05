#!/bin/bash
set -e
set -x

echo "TEST SCRIPT BEGIN"

ceph -s

ceph osd pool create testpool 30

rbd pool init testpool

rbd create testpool/testimage --size 100

rbd --image testpool/testimage info

rbd feature disable testpool/testimage object-map fast-diff deep-flatten

MAP_DEV=$(rbd device map testpool/testimage --id admin)

ls $MAP_DEV

rbd device list

mkfs.ext4 -m0 $MAP_DEV

mkdir -p /mnt/testimage

mount $MAP_DEV /mnt/testimage

echo "testing a lot!" >> /mnt/testimage/test.txt
echo "testing a lot!" >> /mnt/testimage/test.txt
echo "testing a lot!" >> /mnt/testimage/test.txt

umount /mnt/testimage

rbd device unmap $MAP_DEV

rbd rm testpool/testimage

echo "TEST SCRIPT END"

