#!/usr/bin/env ruby

# ./ranges.rb ripe.tmp CZ\|SK yaml

File.open( "./#{ARGV[0]}", 'r' ).each do |line|
  if line =~ /^[a-zA-Z]+\|(#{ARGV[1]})\|ipv4/
    line = line.split'|'

    if !ARGV[2].nil?
      type = 'yaml' if ARGV[2].strip.downcase == "yaml"
    else
      type = 'other'
    end

    line[4] = 32 - Math.log2(line[4].to_f).floor

    if type == 'yaml'
      puts '- ' + line[3] + '/' + line[4].to_s
    else
      puts line[3] + '/' + line[4].to_s
    end
  end
end
