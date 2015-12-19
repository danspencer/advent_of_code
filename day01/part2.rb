# --- Part Two ---
#
# Now, given the same instructions, find the position of the first character that causes him to enter the basement (floor -1). The first character in the instructions has position 1, the second character has position 2, and so on.
#
# For example:
#
# ) causes him to enter the basement at character position 1.
# ()()) causes him to enter the basement at character position 5.
# What is the position of the character that causes Santa to first enter the basement?

puzzle = File.read("puzzle.txt")

floor = 0
first_basement_visit = true

puzzle.each_char.with_index do |c, index|
  if c == "("
    floor = floor + 1
  end
  if c == ")"
    floor = floor - 1
  end

  if floor == -1 && first_basement_visit
    first_basement_visit = false
    puts "Elevator reached the basement for the first time at position: " + (index + 1).to_s
  end
end
puts "Santa went to floor #{floor} \n"
