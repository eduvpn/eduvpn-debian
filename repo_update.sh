#!/bin/bash -ve

KEY=eduvpn+debian@surfnet.nl
DIST=stretch
REPO=eduVPN

aptly publish update -gpg-key=${KEY} ${DIST}
