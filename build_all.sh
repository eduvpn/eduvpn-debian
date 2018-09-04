#!/bin/bash -ve

REPO_DIR=${HOME}/.aptly/public

sudo apt-get -y install build-essential devscripts aptly

PACKAGE_LIST=(\
    BaconQrCode \
    php-oauth2-client \
    php-yubitwee \
    php-otp-verifier \
    php-sqlite-migrate \
    php-oauth2-server \
    php-secookie \
    Twig-extensions \
    php-saml-ds \
    php-openvpn-connection-manager \
    vpn-lib-common \
    vpn-server-api \
    vpn-user-portal \
    vpn-server-node \
    vpn-admin-portal \
    php-json-signer \
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
