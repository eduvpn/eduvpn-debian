#!/bin/bash -ve

KEY=eduvpn+debian@surfnet.nl
DIST=stretch
REPO=eduVPN

aptly publish -gpg-key=${KEY} -distribution=${DIST} -architectures="amd64,i386,all,source" repo ${REPO}
gpg --export --armor ${KEY} > ~/.aptly/public/${REPO}.key
