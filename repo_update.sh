#!/bin/bash -ve

KEY=eduvpn+debian@surfnet.nl
DIST=stretch

aptly publish update -gpg-key=${KEY} ${DIST}
