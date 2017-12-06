#!/bin/bash -ve

DIST=stretch
REPO=eduVPN

aptly publish drop ${DIST} || true
aptly repo drop ${REPO} || true

# create a new repository
aptly repo create -architectures="amd64,i386" ${REPO}
