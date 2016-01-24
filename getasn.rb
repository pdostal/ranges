#!/usr/bin/env ruby

# ./getasn.rb AS2852 yaml CESNET

require 'open-uri'
require 'json'

url = 'https://stat.ripe.net/data/announced-prefixes/data.json?preferred_version=1.1&resource='
data = open(url + ARGV[0], 'r').read
json = JSON.parse data
json['data']['prefixes'].each do |prefix|
  if !ARGV[1].nil?
    family = 'other'
    family = 4 if ARGV[1].strip.downcase == "ipv4"
    family = 6 if ARGV[1].strip.downcase == "ipv6"
  else
    type = 'other'
  end

  if !ARGV[2].nil?
    type = 'other'
    type = 'yaml' if ARGV[2].strip.downcase == "yaml"
  else
    type = 'other'
  end

  if family == 4
    if type == 'yaml'
      puts "- '" + prefix['prefix'] + " via \"eth0\"' # #{ARGV[3]}" if prefix['prefix'] =~ /\./
    else
      puts prefix['prefix'] if prefix['prefix'] =~ /\./
    end
  end

  if family == 6
    if type == 'yaml'
      puts "- '" + prefix['prefix'] + " via \"eth0\"' # #{ARGV[3]}" if prefix['prefix'] =~ /\:/
    else
      puts prefix['prefix'] if prefix['prefix'] =~ /\:/
    end
  end

end
