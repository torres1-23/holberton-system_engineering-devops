#!/usr/bin/env ruby
# Accepts one argument and pass it to a regular expression matching method.
# regex must match: hbn with up to any t's between the b and n.
puts ARGV[0].scan(/hbt*n/).join
