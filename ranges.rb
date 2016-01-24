#!/usr/bin/env ruby

# ./ranges.rb ripe.tmp CZ\|SK yaml CZSK

File.open( "./#{ARGV[0]}", 'r' ).each do |line|
  if line =~ /^[a-zA-Z]+\|(#{ARGV[1]})\|ipv4/
    line = line.split'|'

    line[4] = 32 - Math.log2(line[4].to_f).floor

    if ARGV[2] == "yaml"
      puts "- '" + line[3] + '/' + line[4].to_s + " via \"eth0\"' # #{ARGV[3]}"
    else
      puts line[3] + '/' + line[4].to_s
    end

  end
end
