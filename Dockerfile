FROM centos:7.4.1708

LABEL version="1.0"
LABEL description="A container to build RPMS."

RUN yum -y groupinstall "Development Tools" && \
    yum -y install rpmdevtools rpmlint && \
    /bin/echo "%_topdir /build" > /root/.rpmmacros

ADD run.sh /run.sh

ENTRYPOINT [ "/run.sh" ]
