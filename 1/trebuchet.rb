input_file = File.open('trebuchet.txt', 'r')
lines = input_file.readlines

sum = 0

lines.each do |line|
  line = line.scan(/\d/).join('')
  if line.length == 1
    sum += (line[0] + line[0]).to_i
  elsif line.length > 1
    sum += (line[0] + line[-1]).to_i
  end
end

puts sum
