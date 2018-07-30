FROM flaviostutz/ceph-base

RUN apt-get update
RUN apt-get install -y librados-dev librbd-dev

ENV CEPH_MONITOR_HOST ''
ENV CEPH_KEYRING_BASE64 ''
ENV ETCD_URL ''

ENV CEPH_AUTH 'cephx'
ENV CEPH_USER 'admin'
ENV CEPH_CLUSTER_NAME 'ceph'

ADD entrypoint.sh /
ADD initialize.sh /
ADD startup.sh /
ADD test.sh /
ADD ceph.conf.template /

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "/startup.sh" ]
