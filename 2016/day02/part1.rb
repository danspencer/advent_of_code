require "pry"

input = File.read("input.txt")

x = 0
y = 0

@current_location = { x: x, y: y }
@orientation = { U: -1, R: 1, D: 1, L: -1 }

def validate_next_location(direction)
  #binding.pry
  if direction == "L"
    if @current_location["x".to_sym] + @orientation[direction.to_sym] > -2
      @current_location = { x: @current_location["x".to_sym] + @orientation[direction.to_sym], y: @current_location[:y]}
      return true
    end
  elsif direction == "D"
    if @current_location["y".to_sym] + @orientation[direction.to_sym] < 2
      @current_location = { x: @current_location[:x], y: @current_location["y".to_sym] + @orientation[direction.to_sym]}
      return true
    end
  elsif direction == "R"
    if @current_location["x".to_sym] + @orientation[direction.to_sym] < 2
      @current_location = { x: @current_location["x".to_sym] + @orientation[direction.to_sym], y: @current_location[:y]}
      return true
    end
  elsif direction == "U"
    if @current_location["y".to_sym] + @orientation[direction.to_sym] > -2
      @current_location = {x: @current_location[:x], y: @current_location["y".to_sym] + @orientation[direction.to_sym]}
      return true
    end
  else
    throw StandardError.new
  end

  return false
end

input.each_line do |line|
  line.chomp.each_char do |direction|
    if validate_next_location(direction)
      #puts "Direction: #{direction} New location: #{@current_location}"
    else
      #puts "Direction: #{direction} Instruction skipped"
    end
  end
  puts "Final line location: #{@current_location}"
  #binding.pry
end

#16138
