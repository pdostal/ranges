#!/usr/bin/env ruby

# ./getasn.rb AS2852 yaml CESNET

require 'open-uri'
require 'json'

url = 'https://stat.ripe.net/data/announced-prefixes/data.json?preferred_version=1.1&resource='
data = open(url + ARGV[0], 'r').read
json = JSON.parse data
json['data']['prefixes'].each do |prefix|
  
  if ARGV[1] == "ipv4"
    if ARGV[2] == 'yaml'
      puts "- '" + prefix['prefix'] + " via \"eth0\"' # #{ARGV[3]}" if prefix['prefix'] =~ /\./
    else
      puts prefix['prefix'] if prefix['prefix'] =~ /\./
    end
  end

  if ARGV[1] == "ipv6"
    if ARGV[2] == 'yaml'
      puts "- '" + prefix['prefix'] + " via \"eth0\"' # #{ARGV[3]}" if prefix['prefix'] =~ /\:/
    else
      puts prefix['prefix'] if prefix['prefix'] =~ /\:/
    end
  end

end
