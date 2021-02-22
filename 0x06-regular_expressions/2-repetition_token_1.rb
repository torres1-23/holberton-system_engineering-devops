#!/usr/bin/env ruby
# Accepts one argument and pass it to a regular expression matching method.
# regex must match: htn with one b between the h and t.
puts ARGV[0].scan(/hb?tn/).join
