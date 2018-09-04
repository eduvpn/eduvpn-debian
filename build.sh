#!/bin/bash -ve

REPO=eduVPN
NAME=$(basename "${PWD}")
VERSION=$(cat debian/changelog | head -1 | cut -d "(" -f 2 | cut -d ")" -f 1 | cut -d '-' -f 1)
rm -rf build
mkdir -p build
uscan --destdir=build --download-current-version
(
  cd build
  if [ -f "${NAME}-${VERSION}.tar.gz" ]
  then
    tar -xzf "${NAME}-${VERSION}.tar.gz"
  elif [ -f "${NAME}-${VERSION}.tar.xz" ] 
  then
    tar -xJf "${NAME}-${VERSION}.tar.xz"
  else
    echo "unable to unpack file"
    exit 1
  fi

  cd "${NAME}-${VERSION}"
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
