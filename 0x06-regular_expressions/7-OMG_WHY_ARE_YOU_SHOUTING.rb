#!/usr/bin/env ruby
# Accepts one argument and pass it to a regular expression matching method.
# regex must match: Only capital letters.
puts ARGV[0].scan(/[A-Z]*/).join
