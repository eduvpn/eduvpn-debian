#!/bin/bash -ve

KEY=software@example.org
DIST=buster

aptly publish update -gpg-key=${KEY} ${DIST}
