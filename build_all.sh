#!/bin/bash

sudo apt-get install build-essential devscripts aptly

PACKAGE_LIST=(\
    BaconQrCode \
    php-oauth2-client \
    php-yubitwee \
    otp \
    php-oauth2-server \
    php-secookie \
    Twig-extensions \
    php-saml-ds \
    vpn-lib-common \
    vpn-server-api \
    vpn-user-portal \
    vpn-server-node \
    vpn-admin-portal \
)

./repo_setup.sh

for f in "${PACKAGE_LIST[@]}"
do
    (
        cd ${f}
        ../build.sh
    )
    ./repo_update.sh
done
