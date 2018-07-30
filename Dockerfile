FROM flaviostutz/ceph-base

RUN apt-get update
RUN apt-get install -y xfsprogs kmod

ENV CEPH_MONITOR_HOST ''
ENV CEPH_KEYRING_BASE64 ''
ENV ETCD_URL ''

ENV CEPH_AUTH 'cephx'
ENV CEPH_USER 'admin'
ENV CEPH_CLUSTER_NAME 'ceph'

ENV RBD_CACHE_ENABLED 'true'
ENV RBD_CACHE_MAX_DIRTY '0'

ADD entrypoint.sh /
ADD initialize.sh /
ADD status.sh /
ADD test.sh /
ADD ceph.conf.template /

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "/status.sh" ]
