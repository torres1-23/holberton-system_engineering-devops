#!/usr/bin/env ruby
# Accepts one argument and pass it to a regular expression matching method.
# Output should be: [SENDER],[RECEIVER],[FLAGS].
puts ARGV[0].scan(/\[from:(.*?)\] \[to:(.*?)\] \[flags:(.*?)\]/ ).join(",")
