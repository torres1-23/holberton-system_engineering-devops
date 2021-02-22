#!/usr/bin/env ruby
# Accepts one argument and pass it to a regular expression matching method.
# regex must match: hbtn up to any t's.
puts ARGV[0].scan(/hbt{1,}n/).join
