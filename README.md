# Introduction

Repository to build (all) Debian packages related to eduVPN.

# Dependencies

    $ sudo apt-get -y install build-essential devscripts aptly equivs

# Signing

    $ gpg --batch --quick-generate-key --passphrase '' software@example.org

Set the email address you use as `KEY` in the `repo_setup.sh` and 
`repo_update.sh`.

Add your key to the trusted store, where `vpn@example.org` is the address you
used for the key:

    $ gpg -a --export software@example.org | sudo apt-key add -

# Repository

Add the (temporary) repository to your apt sources so dependencies can be 
resolved during (chained) build:

## Debian

    $ echo "deb file://${HOME}/.aptly/public buster main"     | sudo tee -a /etc/apt/sources.list
    $ echo "deb-src file://${HOME}/.aptly/public buster main" | sudo tee -a /etc/apt/sources.list

# Build

    $ wget https://github.com/eduVPN/eduvpn-debian/archive/buster.tar.gz
    $ tar -xzf buster.tar.gz
    $ cd eduvpn-debian-buster
    $ ./build_all.sh

The script uses `sudo` quite a bit, and also `gpg`, so you may be asked for
your password during the build.

After everything is done, you can find the repository in 
`${HOME}/.aptly/public`. Copy this to a public web server and have the VPN 
server add this repository and key, just like above, but then with the correct
URLs.
