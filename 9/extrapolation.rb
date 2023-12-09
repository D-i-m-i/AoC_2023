# FILE IS LOADED AND READY FOR ACTION
input_file = File.open('input.txt', 'r')
lines = input_file.readlines.map(&:split)

# CREATE AN ARRAY OF NOS BASED ON THE DIFFERENCES OF THE PREVIOUS ONE
# REPEAT UNTIL THE ARRAY CREATED IS MADE UP OF ONLY ZEROS
# EXTRAPOLATE TO GET THE NEXT NUMBER OF THE ORIGINAL SERIES

produced_arrays = []

lines.each do |line|
  produced_arrays.append(line.map(&:to_i))
  line = line.map(&:to_i)
  flag = true
  while flag
    next_array = []
    line.each_with_index do |number, index|
      break if index == (line.length - 1)

      difference = (line[index + 1] - number)
      next_array.append(difference)
    end
    produced_arrays.append(next_array)
    line = next_array
    flag = false if next_array.all? { |num| num.zero? }
  end
end

extrapolated_number = 0
produced_arrays.each do |array|
  extrapolated_number += array[-1]
end
puts "The answer is #{extrapolated_number}"
