FROM flaviostutz/ceph-base:13.2.5.2

RUN apt-get update
RUN apt-get install -y xfsprogs kmod

ENV MONITOR_HOSTS ''
ENV ETCD_URL ''

ENV CEPH_AUTH 'cephx'
ENV CEPH_USER 'admin'
ENV CEPH_CLUSTER_NAME 'ceph'
ENV CEPH_KEYRING_BASE64 ''

# ENV RBD_CACHE_ENABLED 'true'
# ENV RBD_CACHE_MAX_DIRTY '0'

ADD entrypoint.sh /
ADD initialize.sh /
ADD status.sh /
ADD ceph.conf.template /

ADD example-mount.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "/status.sh" ]
