#Game 1: 1 green, 2 blue; 15 blue, 12 red, 2 green; 4 red, 6 blue; 10 blue, 8 red; 3 red, 12 blue; 1 green, 12 red, 8 blue
# iterate over the lines
# isolate game ID of current line
# split string at semicolon and commas
# iterate over the resulted array and find the max number for each color
# do a comparison with initial known values. If any is larger than initial values, scrap the line. If not store the ID in an array

# file is loaded and ready for action!
input_file = File.open('input.txt', 'r')
lines = input_file.readlines

game_powers = []

lines.each do |line|
  # for isolating the game ID as an integer
  current_id = line.split(':')[0].split(' ')[1].to_i

  # for splitting the string into an array of colour/number pairs
  delimiters = [', ', '; ']
  number_color_pairs = line.split(':')[1].split(Regexp.union(delimiters))

  blue_cubes = 0
  green_cubes = 0
  red_cubes = 0

  # go through each pair of color/number and determine the largest number for each color
  number_color_pairs.each do |pair|
    pair = pair.split
    if pair[1] == 'blue' && pair[0].to_i > blue_cubes
      blue_cubes = pair[0].to_i
    elsif pair[1] == 'green' && pair[0].to_i > green_cubes
      green_cubes = pair[0].to_i
    elsif pair[1] == 'red' && pair[0].to_i > red_cubes
      red_cubes = pair[0].to_i
    end
  end

  p "Sum of powers is #{game_powers.append(blue_cubes * green_cubes * red_cubes).sum}"
end
