#!/bin/bash -ve

DIST=stretch
REPO=eduVPN

aptly publish drop ${DIST} || true
aptly repo drop ${REPO} || true

# create a new repository
aptly repo create -architectures="amd64,i386" ${REPO}
aptly publish -gpg-key=${KEY} -distribution=${DIST} -architectures="amd64,i386,all,source" repo ${REPO}
gpg --export --armor ${KEY} > ~/.aptly/public/${REPO}.key
