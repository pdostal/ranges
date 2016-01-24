#!/usr/bin/env ruby

# ./assignments.rb iana.tmp RIPE\ NCC yaml RIPE

File.open( "./#{ARGV[0]}", 'r' ).each do |line|
  if line =~ /^[0-9]+\/[0-9]+,#{ARGV[1]}/
    line = line.split','
    line[0] = line[0].split'/'

    if ARGV[2] == "yaml"
      puts "- '" + line[0][0] + '.0.0.0/' + line[0][1] + " via \"eth0\"' # #{ARGV[3]}"
    else
      puts line[0][0] + '.0.0.0/' + line[0][1]
    end

  end
end
