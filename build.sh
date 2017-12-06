#!/bin/sh
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
  debuild -uc -us
)
