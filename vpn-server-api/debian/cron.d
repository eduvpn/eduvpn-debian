RANDOM_DELAY=10

@hourly www-data /usr/bin/vpn-server-api-housekeeping --instance default
@daily www-data /usr/bin/vpn-server-api-stats --instance default
