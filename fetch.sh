#!/usr/bin/env bash

echo "`date`: Fetching from www.iana.org ..."
curl -s https://www.iana.org/assignments/ipv4-address-space/ipv4-address-space.csv > iana.tmp
echo "`date`: Fetching from ftp.arin.net ..."
curl -s ftp.arin.net/pub/stats/arin/delegated-arin-extended-latest > arin.tmp
echo "`date`: Fetching from ftp.ripe.net ..."
curl -s ftp.ripe.net/ripe/stats/delegated-ripencc-latest > ripe.tmp
echo "`date`: Fetching from ftp.afrinic.net ..."
curl -s ftp.afrinic.net/pub/stats/afrinic/delegated-afrinic-latest > afrinic.tmp
echo "`date`: Fetching from ftp.apnic.net ..."
curl -s ftp.apnic.net/pub/stats/apnic/delegated-apnic-latest > apnic.tmp
echo "`date`: Fetching from ftp.lacnic.net ..."
curl -s ftp.lacnic.net/pub/stats/lacnic/delegated-lacnic-latest > lacnic.tmp
echo "`date`: Done"
