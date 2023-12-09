# FILE IS LOADED AND READY FOR ACTION
input_file = File.open('input.txt', 'r')
lines = input_file.readlines.map(&:split)

# CREATE AN ARRAY OF NOS BASED ON THE DIFFERENCES OF THE PREVIOUS ONE
# REPEAT UNTIL THE ARRAY CREATED IS MADE UP OF ONLY ZEROS
# EXTRAPOLATE TO GET THE NEXT NUMBER OF THE ORIGINAL SERIES

final_arrays = []
sum = 0
run = 1
# ITERATING LINE BY LINE
lines.each do |line|
  # ********************START OF A NEW RUN**************************
  produced_arrays = []
  # POPULATE WITH THE STARTING ARRAY
  line = line.map(&:to_i)
  produced_arrays.append(line)
  flag = true
  while flag
    next_array = []
    # ITERATE THROUGH EACH ELEMENT OF THE ARRAY
    line.each_with_index do |number, index|
      break if index == (line.length - 1)

      difference = (line[index + 1] - number)
      next_array.append(difference)
    end
    produced_arrays.append(next_array)
    line = next_array
    flag = false if next_array.all? { |num| num.zero? }
    final_arrays.append(produced_arrays)
  end
  run += 1
  extrapolated_number = 0
  produced_arrays.reverse.each do |array|
    extrapolated_number = array[0] - extrapolated_number
  end
  sum += extrapolated_number
end

puts "Sum is #{sum}"
