# --- Part Two ---
#
# You just finish implementing your winning light pattern when you realize you mistranslated Santa's message from Ancient Nordic Elvish.
#
# The light grid you bought actually has individual brightness controls; each light can have a brightness of zero or more. The lights all start at zero.
#
# The phrase turn on actually means that you should increase the brightness of those lights by 1.
#
# The phrase turn off actually means that you should decrease the brightness of those lights by 1, to a minimum of zero.
#
# The phrase toggle actually means that you should increase the brightness of those lights by 2.
#
# What is the total brightness of all lights combined after following Santa's instructions?
#
# For example:
#
# turn on 0,0 through 0,0 would increase the total brightness by 1.
# toggle 0,0 through 999,999 would increase the total brightness by 2000000.

command = ""

@lights = Array.new(1000) { Array.new(1000, 0) }

def parse_string(input)
  command = input.match(/[[:alpha:]\s]*/).to_s.rstrip
  starting_coordinate = input.match(/\d{1,3}[,]\d{1,3}/)
  ending_coordinate = input.match(/\d{1,3}[,]\d{1,3}$/)
  run_command(command, starting_coordinate, ending_coordinate)
end

def run_command(command, starting_coordinate, ending_coordinate)
  sc = starting_coordinate.to_s.split(',')
  ec = ending_coordinate.to_s.split(',')
  (sc[0].to_i..ec[0].to_i).each do |row|
    (sc[1].to_i..ec[1].to_i).each do |column|
      if command == "turn on"
        @lights[row][column] = @lights[row][column] + 1
      elsif command == "turn off"
        if @lights[row][column] > 0 then
          @lights[row][column] = @lights[row][column] - 1
        end
      else
        @lights[row][column] = @lights[row][column] + 2
      end
    end
  end
end

inputs = File.read("input.txt")

inputs.each_line do |input|
  parse_string(input)
end

puts @lights.flatten(1).inject(:+)
