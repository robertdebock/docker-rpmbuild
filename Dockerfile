FROM centos

LABEL version="1.0"
LABEL description="A container to build RPMS."

RUN yum -y groupinstall "Development Tools" && \
    yum -y install rpmdevtools && \
    /bin/echo "%_topdir /build" > /root/.rpmmacros

CMD for directory in SOURCES ; do echo "Crearting ${directory}" ; mkdir ${directory} ; done && \
    find /build/SPECS -name '*.spec' -exec spectool -A -g -D -C /build/SOURCES/ {} \; && \
    find /build/SPECS -name '*.spec' -exec rpmbuild -ba {} \;
