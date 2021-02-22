#!/usr/bin/env ruby
# Accepts one argument and pass it to a regular expression matching method.
# regex must match: hbn with up to 4 t's between the b and n.
puts ARGV[0].scan(/hbt{0,4}n/).join
