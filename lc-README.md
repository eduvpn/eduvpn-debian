# Introduction

Repository to build (all) Debian packages related to eduVPN.

# Dependencies

    $ sudo apt -y install devscripts pbuilder dpkg-dev apt-utils gpg-agent gpg

The breakdown: lc-repo_setup needs package pbuilder (for it calls pbuilder);
lc-build needs devscripts (for uscan), pbuilder (pdebuild), dpkg-dev
(dpkg-scanpackages dpkg-scansources); lc-build_all needs dpkg-dev
(dpkg-scanpackages dpkg-scansources), apt-utils (apt-ftparchive), gpg-agent
(gpg-agent); lc-repo_sign needs gpg (gpg).  The script lc-repo_setup calls
"sudo pbuilder create" and "sudo pbuilder update", and calls "sudo chown $USER
/var/cache/pbuilder".  The scripts need access to http://deb.debian.org/.  And
uscan fetches upstream tarballs from whatever is specified in
<package>/debian/watch in the git repository.


# Signing

FIXME

Aplty only supports GnuPG 1, because it is only 2019. Specify 
`software@example.org` as email address.

    $ gpg1 --gen-key

Set the email address you use as `KEY` in the `repo_setup.sh` and 
`repo_update.sh`.

Add your key to the trusted store, where `vpn@example.org` is the address you
used for the key:

    $ gpg1 -a --export software@example.org | sudo apt-key add -

# Repository

FIXME NOT NEEDED: TAKEN CARE OF BY THE SCRIPTS


Add the (temporary) repository to your apt sources so dependencies can be 
resolved during (chained) build:

## Debian

    $ echo "deb file://${HOME}/.aptly/public buster main"     | sudo tee -a /etc/apt/sources.list
    $ echo "deb-src file://${HOME}/.aptly/public buster main" | sudo tee -a /etc/apt/sources.list

# Build

FIXME: lc-build_all from within git checkout i'd guess?

FIXME: for "users":

 apt-get source pkgname
 apt-get build-dep pkgname    or dpkg-checkbuilddeps
 cd pkgname-*
 debuild -uc -us      (or dpkg-buildpackage -uc -us)


    $ wget https://github.com/eduVPN/eduvpn-debian/archive/buster.tar.gz
    $ tar -xzf buster.tar.gz
    $ cd eduvpn-debian-buster
    $ ./build_all.sh

The `build.sh` script called by `build_all.sh` uses `sudo` for some steps.

After everything is done, you can find the repository in 
`${HOME}/.aptly/public`. Copy this to a public web server and have the VPN 
server add this repository and key, just like above, but then with the correct
URLs.
