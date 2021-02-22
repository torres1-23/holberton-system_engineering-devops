#!/usr/bin/env ruby
# Accepts one argument and pass it to a regular expression matching method.
# regex must match: 10 digits.
puts ARGV[0].scan(/^\d{10}$/).join
