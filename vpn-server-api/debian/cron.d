RANDOM_DELAY=10

@hourly www-data /usr/bin/vpn-server-api-housekeeping
@hourly www-data /usr/bin/vpn-server-api-disconnect-expired-certificates
@daily www-data /usr/bin/vpn-server-api-stats
