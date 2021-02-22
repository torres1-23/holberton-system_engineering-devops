#!/usr/bin/env ruby
# Accepts one argument and pass it to a regular expression matching method.
# regex must match: hn and can have any single character in between.
puts ARGV[0].scan(/h.n/).join
