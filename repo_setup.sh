#!/bin/bash -ve

# create a repository and sync with the eduVPN public repository.
#
# package dependencies: aptly

KEY=eduvpn+debian@surfnet.nl
DIST=stretch
REPO=eduVPN

# remove any old local repository
aptly publish drop ${DIST} || true
aptly repo drop ${REPO} || true

# create a new repository
aptly repo create -architectures="amd64,i386" ${REPO}

# add the binary packages 
#aptly repo add ${REPO} build/*.deb

# add the source packages
#aptly repo add ${REPO} build/*.dsc

# localy publish the repository
#aptly publish -gpg-key=${KEY} -distribution=${DIST} -architectures="amd64,i386" repo ${REPO}
#aptly publish -gpg-key=${KEY} -distribution=${DIST} -architectures="amd64,i386,all,source" repo ${REPO}
#aptly publish update -gpg-key=${KEY} stretch

# export the key which was used during packaging
#gpg --export --armor ${KEY} > ~/.aptly/public/${REPO}.key

# publish the repo online
#rsync -4rv --del ~/.aptly/public/* gimo@static.eduvpn.nl:/var/www/html/web/repo/debian

