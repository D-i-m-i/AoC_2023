# FILE IS LOADED AND READY FOR ACTION
input_file = File.open('input.txt', 'r')
lines = input_file.readlines.map(&:strip)

# GO THROUGH THE INPUT FILE AND CREATE HASHES FOR ALL WITH 'LEFT', 'RIGHT' KEYS
network_hash = {}
instructions = lines.first
network = lines[2, lines.index(lines.last)]

network.each do |route|
  location = route.split('=')[0].strip
  coordinates = route.split('=')[1].strip[1..-2].split(',').map(&:strip)
  # pp "coordinates are #{coordinates}"
  left = coordinates[0]
  right = coordinates[1]
  new_hash = { left: left, right: right }
  network_hash["#{location}"] = new_hash
end

stops = []

network_hash.each do |key, _|
  stops.append(key) if key[2] == 'A'
end

p stops

# ITERATE THROUGH THE INSTRUCTIONS
# GO FIND THE CORRESPONDING HASH AND READ THE PATH
steps = []
steps_count = 0

stop_1 = stops[0]
stop_2 = stops[1]
stop_3 = stops[2]
stop_4 = stops[3]
stop_5 = stops[4]
stop_6 = stops[5]

until stop_1[-1] == 'Z' # && stop_2[-1] == 'Z' && stop_3[-1] == 'Z' && stop_4[-1] == 'Z' && stop_5[-1] == 'Z' && stop_6[-1] == 'Z'
  instructions.each_char do |char|
    if char == 'L'
      stop_1 = network_hash[stop_1][:left]
      stop_2 = network_hash[stop_2][:left]
      stop_3 = network_hash[stop_3][:left]
      stop_4 = network_hash[stop_4][:left]
      stop_5 = network_hash[stop_5][:left]
      stop_6 = network_hash[stop_6][:left]
    elsif char == 'R'
      stop_1 = network_hash[stop_1][:right]
      stop_2 = network_hash[stop_2][:right]
      stop_3 = network_hash[stop_3][:right]
      stop_4 = network_hash[stop_4][:right]
      stop_5 = network_hash[stop_5][:right]
      stop_6 = network_hash[stop_6][:right]
    end
    steps_count += 1

    # break if (stop_1[-1] == 'Z' && stop_2[-1] == 'Z' && stop_3[-1] == 'Z' && stop_4[-1] == 'Z' && stop_5[-1] == 'Z' && stop_6[-1] == 'Z')
  end
end

steps.append(steps_count)
steps_count = 0

# THESE NUMBERS CAN BE FOUND BY CHECKING THE STEPS FOR EACH INDIVIDUAL 'STOP'
numbers = [22199, 13207, 16579, 18827, 17141, 14893]
lcm = numbers.reduce(:lcm)

puts "LCM of #{numbers} is #{lcm}"
