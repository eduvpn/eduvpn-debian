#!/bin/bash -ve

KEY=eduvpn+debian@surfnet.nl
DIST=stretch
#DIST=bionic

aptly publish update -gpg-key=${KEY} ${DIST}
