#!/bin/sh -x

setup() {
  echo "Creating required directories."
  rpmdev-setuptree
}

run() {
  specfile="/build/${1}"

  grep 'BuildRequires: ' "${specfile}" > /dev/null 2>&1 && buildrequires=yes
  if [ "${buildrequires}" ] ; then
    echo "Installing all BuildRequires."
    yum -y install $(grep 'BuildRequires: ' "${specfile}" | cut -d: -f2-)
  fi

  echo "Installing all Sources and Patches."
  spectool -A -g -D -C /build/SOURCES "${specfile}"

  echo "Linting spec file."
  rpmlint "${specfile}"

  chown root:root "${specfile}"

  rpmbuild -ba "${specfile}"
}

setup
run "${1}"
