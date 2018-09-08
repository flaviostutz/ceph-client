#!/bin/bash
set -e
set -x

echo "TEST SCRIPT BEGIN"

ceph -s

ceph osd pool create docker-volumes 30

rbd pool init docker-volumes

rbd create docker-volumes/testimage --size 100

rbd --image docker-volumes/testimage info

rbd feature disable docker-volumes/testimage object-map fast-diff deep-flatten journaling

MAP_DEV=$(rbd device map docker-volumes/testimage --id admin)

ls $MAP_DEV

rbd device list

mkfs.xfs $MAP_DEV

mkdir -p /mnt/testimage

mount $MAP_DEV /mnt/testimage

echo "testing a lot!" >> /mnt/testimage/test.txt
echo "testing a lot!" >> /mnt/testimage/test.txt
echo "testing a lot!" >> /mnt/testimage/test.txt

umount /mnt/testimage

rbd device unmap $MAP_DEV

rbd rm docker-volumes/testimage

echo "TEST SCRIPT END"

