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
  new_hash = { left: left, right: right  }
  network_hash["#{location}"] = new_hash
end

# ITERATE THROUGH THE INSTRUCTIONS
# GO FIND THE CORRESPONDING HASH AND READ THE PATH
stop = 'AAA'
steps = 0

while stop != 'ZZZ'
  instructions.each_char do |char|
    if char == 'L'
      stop = network_hash[stop][:left]
    elsif char == 'R'
      stop = network_hash[stop][:right]
    end
    steps += 1
    break if stop == 'ZZZ'
  end
end

puts "FOUND ZZZ IN #{steps} steps"
