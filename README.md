# docker-rpmbuild
A Docker image capable to building RPM's.

The Docker image can be found here:
https://hub.docker.com/r/robertdebock/docker-rpmbuild/

# Good to know
Building RPMS requires a specific directory structure. Probably you are going to have a directory for each RPM you are going to build. In that case, this structure will be useful:
```
newpackage/SPECS/newpackage.spec
somepackage/SPECS/somepackage.spec
```

A few directories will be added later by `rpmbuild`: BUILD, BUILDROOT, RPMS, SOURCES, SRPMS.

# Making a SPEC file
A quick empty .spec file is easy create:

```
docker run \
  -v $(pwd)/newpackage/:/build \
  robertdebock/docker-rpmbuild \
  rpmdev-newspec --ouput /build/SPECS/newpackage.spec
```

# Building
Start the docker image with mount options to insert the .spec file.
```
docker run \
  -v $(pwd)/newpackage/:/build
  robertdebock/docker-rpmbuild
```

All requirements (Source:, SourceN:, PatchN and BuildRequires) will be installed.
