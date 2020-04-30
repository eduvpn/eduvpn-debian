#!/bin/bash -ve

REPO_DIR=${HOME}/.aptly/public

sudo apt-get -y install build-essential devscripts aptly equivs

PACKAGE_LIST=(\
    vpn-ca \
    BaconQrCode \
    php-jwt \
    php-otp-verifier \
    php-sqlite-migrate \
    php-oauth2-server \
    php-secookie \
    php-saml-sp \
    php-openvpn-connection-manager \
    vpn-lib-common \
    vpn-server-api \
    vpn-user-portal \
    vpn-server-node \
    php-json-signer \
    vpn-portal-artwork-eduVPN \
    vpn-portal-artwork-LC \
    php-saml-ds \
    php-saml-ds-artwork-eduVPN \
)

./repo_setup.sh

for f in "${PACKAGE_LIST[@]}"
do
    (
        cd "${f}" || exit
        ../build.sh
    )
    ./repo_update.sh
done

# Create Archive
DATETIME=$(date +%Y%m%d%H%M%S)
(
    cd "${REPO_DIR}" || exit
    tar -cJf "${HOME}/debRepo-${DATETIME}.tar.xz" .
)
