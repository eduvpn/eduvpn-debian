#!/bin/bash -ve

KEY=software+debian@letsconnect-vpn.org
DIST=stretch

aptly publish update -gpg-key=${KEY} ${DIST}
