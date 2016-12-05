# The next year, to speed up the process, Santa creates a robot version of himself, Robo-Santa, to deliver presents with him.
#
# Santa and Robo-Santa start at the same location (delivering two presents to the same starting house), then take turns moving based on instructions from the elf, who is eggnoggedly reading from the same script as the previous year.
#
# This year, how many houses receive at least one present?
#
# For example:
#
# ^v delivers presents to 3 houses, because Santa goes north, and then Robo-Santa goes south.
# ^>v< now delivers presents to 3 houses, and Santa and Robo-Santa end up back where they started.
# ^v^v^v^v^v now delivers presents to 11 houses, with Santa going one direction and Robo-Santa going the other.

require 'set'

directions = File.read("input.txt")

moves = { "^": [0,-1], ">": [1,0], "v": [0,1], "<": [-1,0] }

santa_current_location = { x: 0, y: 0 }
santa_locations = Set.new
santa_locations << santa_current_location

robo_current_location = { x: 0, y: 0 }
robo_locations = Set.new
robo_locations << robo_current_location

directions.each_char.with_index do |direction, index|
  if !moves[direction.to_sym].nil?
    if index.odd?
      santa_current_location = { x: santa_current_location[:x] + moves[direction.to_sym][0], y: santa_current_location[:y] + moves[direction.to_sym][1] }
      santa_locations << santa_current_location
    else
      robo_current_location = { x: robo_current_location[:x] + moves[direction.to_sym][0], y: robo_current_location[:y] + moves[direction.to_sym][1] }
      robo_locations << robo_current_location
    end
  end
end

puts "Santa locations: #{santa_locations.length.to_s}"
puts "Robo locations: #{robo_locations.length.to_s}"
puts "Uniqe houses visited by santa and robo-santa locations: #{santa_locations.union(robo_locations).length.to_s}"
