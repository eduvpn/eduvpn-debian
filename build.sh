#!/bin/bash -ve

REPO=LC
NAME=$(basename "${PWD}")
VERSION=$(cat debian/changelog | head -1 | cut -d "(" -f 2 | cut -d ")" -f 1 | cut -d '-' -f 1)
rm -rf build
mkdir -p build
uscan --destdir=build --download-current-version
(
    cd build
    TARDIR="$( tar tf $NAME-*.tar.?? | grep '/$' | sort | head -1 )"
    tar -xf "$NAME"-*.tar.??
    cd "$TARDIR"

    cp -r ../../debian .

    # install build depend    encies
    sudo apt-get update
    # update installed software
    sudo apt-get -y dist-upgrade
    # install build dependencies
    sudo mk-build-deps -i -r debian/control

    # build and sign package
    debuild -uc -us

    # add package to repository
    aptly repo add ${REPO} ../*.deb
    aptly repo add ${REPO} ../*.dsc
)
