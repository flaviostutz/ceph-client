#!/bin/bash
set -e

./initialize.sh

echo "Let's perform some actions..."
ceph -s
ceph osd lspools
rados df
