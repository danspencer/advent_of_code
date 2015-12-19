# Because your neighbors keep defeating you in the holiday house decorating contest year after year, you've decided to deploy one million lights in a 1000x1000 grid.
#
# Furthermore, because you've been especially nice this year, Santa has mailed you instructions on how to display the ideal lighting configuration.
#
# Lights in your grid are numbered from 0 to 999 in each direction; the lights at each corner are at 0,0, 0,999, 999,999, and 999,0. The instructions include whether to turn on, turn off, or toggle various inclusive ranges given as coordinate pairs. Each coordinate pair represents opposite corners of a rectangle, inclusive; a coordinate pair like 0,0 through 2,2 therefore refers to 9 lights in a 3x3 square. The lights all start turned off.
#
# To defeat your neighbors this year, all you have to do is set up your lights by doing the instructions Santa sent you in order.
#
# For example:
#
# turn on 0,0 through 999,999 would turn on (or leave on) every light.
# toggle 0,0 through 999,0 would toggle the first line of 1000 lights, turning off the ones that were on, and turning on the ones that were off.
# turn off 499,499 through 500,500 would turn off (or leave off) the middle four lights.
# After following the instructions, how many lights are lit?

command = ""

@lights = Array.new(1000) { Array.new(1000, false) }

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
        @lights[row][column] = true
      elsif command == "turn off"
        @lights[row][column] = false
      else
        @lights[row][column] = !@lights[row][column]
      end
    end
  end
end
inputs = File.read("input.txt")

inputs.each_line do |input|
  parse_string(input)
end

puts @lights.flatten(1).count(true)
