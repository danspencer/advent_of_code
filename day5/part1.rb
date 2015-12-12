# --- Day 5: Doesn't He Have Intern-Elves For This? ---
#
# Santa needs help figuring out which strings in his text file are naughty or nice.
#
# A nice string is one with all of the following properties:
#
# It contains at least three vowels (aeiou only), like aei, xazegov, or aeiouaeiouaeiou.
# It contains at least one letter that appears twice in a row, like xx, abcdde (dd), or aabbccdd (aa, bb, cc, or dd).
# It does not contain the strings ab, cd, pq, or xy, even if they are part of one of the other requirements.
# For example:
#
# ugknbfddgicrmopn is nice because it has at least three vowels (u...i...o...), a double letter (...dd...), and none of the disallowed substrings.
# aaa is nice because it has at least three vowels and a double letter, even though the letters used by different rules overlap.
# jchzalrnumimnmhp is naughty because it has no double letter.
# haegwjzuvuyypxyu is naughty because it contains the string xy.
# dvszwmarrgswjxmb is naughty because it contains only one vowel.
# How many strings are nice?

def three_vowels?(text)
  text.match(/([aeiou].*){3,}/) ? true : false
end

def back_to_back?(text)
  text.match(/([a-z])\1{1}/) ? true : false
end

def contains_banned_strings?(text)
  text.match(/ab|cd|pq|xy/) ? true : false
end

texts = File.read("input.txt")

nice_strings_count = 0
texts.each_line do |text|
  if three_vowels?(text) && back_to_back?(text) && !contains_banned_strings?(text)
    nice_strings_count = nice_strings_count + 1
  end
end

puts "There are #{nice_strings_count} nice strings!"
