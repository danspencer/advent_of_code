# --- Part Two ---
#
# Now find one that starts with six zeroes.

require 'digest'

digest = Digest::MD5.new

input = "ckczppom"
count = 0

while (!digest.hexdigest(input + count.to_s).match(/^000000/))
  count = count + 1
end

puts "Count: #{count}"
