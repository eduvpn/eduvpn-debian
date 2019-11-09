#!/bin/bash -ve

KEY=software@example.org
DIST=buster
REPO=LC

aptly publish drop ${DIST} || true
aptly repo drop ${REPO} || true

# create a new repository
aptly repo create -architectures="amd64" ${REPO}
aptly publish -gpg-key=${KEY} -distribution=${DIST} -architectures="amd64,all,source" repo ${REPO}
gpg --export --armor ${KEY} > ~/.aptly/public/${REPO}.key
