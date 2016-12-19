require "pry"
input = File.read("input.txt")

y = 0
x = 0
current_location = { x: x, y: y }
orientation_values = { n: 1, e: 1, s: -1, w: -1 }
orientation = "N"
visited_locations = []
visited_locations.push current_location
input.split(',').each do |c|
  d = c.strip.split(/(?<=[a-zA-Z])/)
  if orientation == "N"
    if d[0] == "R"
      orientation = "E"
      y_end = y + d[1].to_i
      while y != y_end
        y = y + 1
        location = { x: x, y: y }
        if visited_locations.any?  {|h| h[:x] == x && h[:y] == y}
          match = true
          break if match
        end
        visited_locations.push location
      end
      break if match
    elsif d[0] == "L"
      orientation = "W"
      y_end = y - d[1].to_i
      while y != y_end
        y = y - 1
        location = { x: x, y: y }
        if visited_locations.any?  {|h| h[:x] == x && h[:y] == y}
          match = true
          break if match
        end
        visited_locations.push location
      end
      break if match
    end
  elsif orientation == "E"
    if d[0] == "R"
      orientation = "S"
      x_end = x - d[1].to_i
      while x != x_end
        x = x - 1
        location = { x: x, y: y }
        if visited_locations.any?  {|h| h[:x] == x && h[:y] == y}
          match = true
          break if match
        end
        visited_locations.push location
      end
      break if match
    elsif d[0] == "L"
      orientation = "N"
      x_end = x + d[1].to_i
      while x != x_end
        x = x + 1
        location = { x: x, y: y }
        if visited_locations.any?  {|h| h[:x] == x && h[:y] == y}
          match = true
          break if match
        end
        visited_locations.push location
      end
      break if match
    end
  elsif orientation == "S"
    if d[0] == "R"
      orientation = "W"
      y_end = y - d[1].to_i
      while y != y_end
        y = y - 1
        location = { x: x, y: y }
        if visited_locations.any?  {|h| h[:x] == x && h[:y] == y}
          match = true
          break if match
        end
        visited_locations.push location
      end
      break if match
    elsif d[0] == "L"
      orientation = "E"
      y_end = y + d[1].to_i
      while y != y_end
        y = y + 1
        location = { x: x, y: y }
        if visited_locations.any?  {|h| h[:x] == x && h[:y] == y}
          match = true
          break if match
        end
        visited_locations.push location
      end
      break if match
    end
  else
    if d[0] == "R"
      orientation = "N"
      x_end = x + d[1].to_i
      while x != x_end
        x = x + 1
        location = { x: x, y: y }
        if visited_locations.any?  {|h| h[:x] == x && h[:y] == y}
          match = true
          break if match
        end
        visited_locations.push location
      end
      break if match
    elsif d[0] == "L"
      orientation = "S"
      x_end = x - d[1].to_i
      while x != x_end
        x = x - 1
        location = { x: x, y: y }
        if visited_locations.any?  {|h| h[:x] == x && h[:y] == y}
          match = true
          break if match
        end
        visited_locations.push location
      end
      break if match
    end
  end
end

total_blocks = x.abs + y.abs

puts "The Easter Bunny HQ is located at x: #{x} and y: #{y} which is #{total_blocks} blocks away.\n"
