#!/usr/bin/env ruby
# Accepts one argument and pass it to a regular expression matching method.
# regex must match: hbtn up to 4 t's.
puts ARGV[0].scan(/hbt{1,4}n/).join
