# FILE IS LOADED AND READY FOR ACTION
input_file = File.open('example_ghosts.txt', 'r')
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

# pp network_hash
network_hash.each do |key, _|
  stops.append(key) if key[2] == 'A'
end

# p stops

# ITERATE THROUGH THE INSTRUCTIONS
# GO FIND THE CORRESPONDING HASH AND READ THE PATH
# stop = 'AAA'
steps = 0

stop_1 = stops[0]
stop_2 = stops[1]

p stop_1
p stop_2

while (stop_1[-1] != 'Z' || stop_2[-1] != 'Z')
  instructions.each_char do |char|
    if char == 'L'
      stop_1 = network_hash[stop_1][:left]
      stop_2 = network_hash[stop_2][:left]
    elsif char == 'R'
      stop_1 = network_hash[stop_1][:right]
      stop_2 = network_hash[stop_2][:right]
    end
    steps += 1
    p stop_1
    p stop_2
    p stop_1[-1]
    p stop_2[-1]
    puts "**********************"
    break if (stop_1[-1] == 'Z' && stop_2[-1] == 'Z')
  end
end

puts "FOUND ZZZ IN #{steps} steps"

# IDENTIFY ALL 'STARTS'
# DO RUNS UNTIL ALL NODES END WITH 'Z'
