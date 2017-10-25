# docker-rpmbuild
A Docker image capable to building RPM's.

The Docker image can be found here:
https://hub.docker.com/r/robertdebock/docker-rpmbuild/

# Requirements
In order for this container to build your RPM, you need to:
- Have a SPEC file.

# Recommended directory structure

Start with this structure: (Where "hello-world" captures the name of your project.
```
.
└── hello-world
    └── SPECS
        └── hello-world.spec
```

# Building

Start the docker image with mount options to insert the .spec file.
```
docker run \
  -v $(pwd)/hello-world/:/build \
  robertdebock/docker-rpmbuild \
  SPECS/hello-world.spec
```

All requirements (Source:, SourceN:, PatchN and BuildRequires) will be installed.

# Result.

When done, you will have a structure like this: (depends a bit on the content of the package.)
```
.
└── hello-world
    ├── BUILD
    │   ├── bin
    │   │   └── hello-world.sh
    │   └── hello-world.sh
    ├── BUILDROOT
    ├── RPMS
    │   └── x86_64
    │       └── hello-world-1.0-1.x86_64.rpm
    ├── SOURCES
    ├── SPECS
    │   └── hello-world.spec
    └── SRPMS
        └── hello-world-1.0-1.src.rpm

```
