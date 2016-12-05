require 'pry'
input = File.read("input.txt")

lr_blocks = 0
ns_blocks = 0
orientation = "N"

input.split(',').each do |c|
  d = c.strip.split(/(?<=[a-zA-Z])/)
  if orientation == "N"
    if d[0] == "R"
      orientation = "E"
      lr_blocks = lr_blocks + d[1].to_i
    elsif d[0] == "L"
      orientation = "W"
      lr_blocks = lr_blocks - d[1].to_i
    end
  elsif orientation == "E"
    if d[0] == "R"
      orientation = "S"
      ns_blocks = ns_blocks - d[1].to_i
    elsif d[0] == "L"
      ns_blocks = ns_blocks + d[1].to_i
      orientation = "N"
    end
  elsif orientation == "S"
    if d[0] == "R"
      lr_blocks = lr_blocks - d[1].to_i
      orientation = "W"
    elsif d[0] == "L"
      orientation = "E"
      lr_blocks = lr_blocks + d[1].to_i
    end
  else
    if d[0] == "R"
      orientation = "N"
      ns_blocks = ns_blocks + d[1].to_i
    elsif d[0] == "L"
      ns_blocks = ns_blocks - d[1].to_i
      orientation = "S"
    end
  end
end
total_blocks = lr_blocks + ns_blocks
puts "The Easter Bunny HQ is #{total_blocks} blocks away.\n"
