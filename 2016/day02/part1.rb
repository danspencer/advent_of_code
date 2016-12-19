#!/usr/bin/env ruby

input = File.read("input.txt")

keypad = { '1': { x: -1, y: -1 },
            '2': { x: 0, y: -1 },
            '3': { x: 1, y: -1 },
            '4': { x: -1, y: 0 },
            '5': { x: 0, y: 0 },
            '6': { x: 1, y: 0 },
            '7': { x: -1, y: 1 },
            '8': { x: 0, y: 1 },
            '9': { x: 1, y: 1 } }

x = 0
y = 0
bathroom_code = ""

current_location = { x: x, y: y }
orientation = { U: -1, R: 1, D: 1, L: -1 }

input.each_line do |line|
  line.chomp.each_char do |direction|
    if direction == "L"
      if current_location[:x] + orientation[direction.to_sym] > -2
        current_location = { x: current_location[:x] + orientation[direction.to_sym], y: current_location[:y]}
      end
    elsif direction == "D"
      if current_location[:y] + orientation[direction.to_sym] < 2
        current_location = { x: current_location[:x], y: current_location[:y] + orientation[direction.to_sym]}
      end
    elsif direction == "R"
      if current_location[:x] + orientation[direction.to_sym] < 2
        current_location = { x: current_location[:x] + orientation[direction.to_sym], y: current_location[:y]}
      end
    elsif direction == "U"
      if current_location[:y] + orientation[direction.to_sym] > -2
        current_location = {x: current_location[:x], y: current_location[:y] + orientation[direction.to_sym]}
      end
    else
      puts "Invalid instruction: #{direction}"
    end
  end

  keypad.each do |k,v|
    if v[:x]==current_location[:x] && v[:y]==current_location[:y]
      bathroom_code << k.to_s
    end
  end
end

puts "The bathroom code is #{bathroom_code}."
