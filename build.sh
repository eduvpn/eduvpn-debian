#!/bin/sh
REPO=eduVPN
NAME=`basename ${PWD}`
VERSION=`cat debian/changelog | head -1 | cut -d '(' -f 2 | cut -d ')' -f 1 | cut -d '-' -f 1`
rm -rf build
mkdir -p build
uscan --destdir=build --download-current-version
(
  cd build
  tar -xzf ${NAME}-${VERSION}.tar.gz
  cd ${NAME}-${VERSION}
  cp -r ../../debian .

  # install build dependencies
  sudo apt-get update
  sudo mk-build-deps -i -r debian/control

  # build and sign package
  debuild -uc -us

  # add package to repository
  aptly repo add ${REPO} ../*.deb
  aptly repo add ${REPO} ../*.dsc
)

../repo_update.sh
