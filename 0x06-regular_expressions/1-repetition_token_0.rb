#!/usr/bin/env ruby
# Accepts one argument and pass it to a regular expression matching method.
# regex must match: hbttn up to five t's.
puts ARGV[0].scan(/hbt{2,5}n/).join
