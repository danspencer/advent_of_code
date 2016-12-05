input = File.read("input.txt")

count = 0
string_literals = 0
characters_in_memory = 0

input.each_line do |line|
  string_literals += line.chomp.size
  if count <= 2 then
    puts line.size
    puts line.chomp.size
  end
  count += 1
end
puts "String literals count: #{string_literals}"
