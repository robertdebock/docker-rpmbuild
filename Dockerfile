FROM centos

LABEL version="1.0"
LABEL description="A container to build RPMS."

RUN yum -y groupinstall "Development Tools" && \
    yum -y install rpmdevtools && \
    /bin/echo "%_topdir /build" > /root/.rpmmacros

CMD for directory in SOURCES ; do echo "Creating ${directory}" ; mkdir ${directory} ; done && \
    echo "Installing all BuildRequires." && \
    find /build/SPECS -name '*.spec' -exec grep 'BuildRequires:' {} | cut -d: -f2-) ; do yum -y install "${rpm}" ; done ;\ && \
    echo "Installing all Sources and Patches." && \
    find /build/SPECS -name '*.spec' -exec spectool -A -g -D -C /build/SOURCES/ {} \; && \
    echo "Building the RPM." && \
    find /build/SPECS -name '*.spec' -exec rpmbuild -ba {} \;
