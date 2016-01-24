#!/usr/bin/env ruby

# ./assignments.rb iana.tmp RIPE\ NCC yaml

File.open( "./#{ARGV[0]}", 'r' ).each do |line|
  if line =~ /^[0-9]+\/[0-9]+,#{ARGV[1]}/
    line = line.split','
    line[0] = line[0].split'/'

    if !ARGV[2].nil?
      type = 'yaml' if ARGV[2].strip.downcase == "yaml"
    else
      type = 'other'
    end

    if type == 'yaml'
      puts "- '" + line[0][0] + '.0.0.0/' + line[0][1] + " via \"eth0\"'"
    else
      puts line[0][0] + '.0.0.0/' + line[0][1]
    end

  end
end
