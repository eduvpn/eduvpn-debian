#!/bin/bash -ve

KEY=eduvpn+debian@surfnet.nl
DIST=stretch
REPO=LC

aptly publish drop ${DIST} || true
aptly repo drop ${REPO} || true

# create a new repository
aptly repo create -architectures="amd64,i386" ${REPO}
aptly publish -gpg-key=${KEY} -distribution=${DIST} -architectures="amd64,i386,all,source" repo ${REPO}
gpg --export --armor ${KEY} > ~/.aptly/public/${REPO}.key
