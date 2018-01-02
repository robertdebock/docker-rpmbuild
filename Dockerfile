FROM centos:7.4.1708

LABEL version="1.3"
LABEL description="A container to build RPMS."

RUN yum -y groupinstall "Development Tools" && \
    yum -y install rpmdevtools rpmlint sudo && \
    useradd rpmbuild && \
    /bin/echo "%_topdir /home/rpmbuild/build" > /home/rpmbuild/.rpmmacros
    
USER rpmbuild

ADD run.sh /run.sh

ADD rpmbuild-sudoers /etc/sudoers.d/rpmbuild-sudoers

CMD [ "sudo", "-u", "rpmbuild", "/run.sh" ]
