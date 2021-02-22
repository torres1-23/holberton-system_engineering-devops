#!/usr/bin/env ruby
# Accepts one argument and pass it to a regular expression matching method
# regex must match: Holberton
puts ARGV[0].scan(/Holberton/).join
