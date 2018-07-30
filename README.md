# ceph-client
Ceph client docker container image with librados, ceph tools and script for keyring download from ETCD and from ENV

## Usage (basic)
Run this container passing a custom command

## Usage (advanced)
Extend this container with
FROM flaviostutz/ceph-client

Call, from your startup script, ./initialize.sh, so that ceph.conf and keyring will be prepared for calling your Ceph cluster.

Set the following Environment variables:

* CEPH\_MONITOR\_HOST - monitor host
* CEPH\_KEYRING\_BASE64 - Keyring file in base64 OR
* ETCD\_URL - URL of ETCD instance that has the keyring at /[ceph-cluster]/keyring
* CEPH\_AUTH 'cephx'
* CEPH\_USER 'admin'
* CEPH\_CLUSTER\_NAME 'ceph'

See a complete example at /example
