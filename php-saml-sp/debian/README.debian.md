# Installation

If not yet done, install and enable Apache and php-fpm:

    $ sudo apt install php-fpm apache2
    $ sudo /usr/sbin/a2enconf php7.3-fpm
    $ sudo /usr/sbin/a2enmod proxy_fcgi

Install php-saml-sp:

    $ sudo apt install php-saml-sp
    $ sudo a2enconf php-saml-sp
    $ sudo systemctl restart apache2

Configure your web server to use a TLS certificate, how to do this is out of
scope here.

# Configuration

All configuration takes place in the `/etc/php-saml-sp` directory. You can 
modify `config.php` in that folder.

The default configuration template contains instructions on how to modify the
file.

The only thing you MUST change is the array `idpList` to contain the entity IDs
of the IdPs you want to give access.

## Metadata

You can place the metadata for the IdPs that have access to your SP in 
`/etc/php-saml-sp/metadata`. Create the folder if it does not yet exist.

## Example
    
    # mkdir /etc/php-saml-sp/metadata
    # cd /etc/php-saml-sp/metadata
    # curl -o x509idp.moonshot.utr.surfcloud.nl.xml https://x509idp.moonshot.utr.surfcloud.nl/metadata

Now modify `/etc/php-saml-sp/config.php` and add 
`https://x509idp.moonshot.utr.surfcloud.nl/metadata` to `idpList`.

Verify the configuration file for syntax errors:

    # php -l /etc/php-saml-sp/config.php

If all is fine you should now be able to test your SP by going to 
`https://sp.example.org/php-saml-sp`, where `sp.example.org` is the host name 
of your server and click the "Test" button to start the SAML login.
