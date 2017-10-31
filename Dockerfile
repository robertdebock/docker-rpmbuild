FROM centos:7.4.1708

LABEL version="1.1"
LABEL description="A container to build RPMS."

RUN yum -y groupinstall "Development Tools" && \
    yum -y install rpmdevtools rpmlint && \
    useradd rpmbuild && \
    /bin/echo "%_topdir /build" > /root/.rpmmacros
    
USER rpmbuild

ADD run.sh /run.sh

ENTRYPOINT [ "/run.sh" ]
