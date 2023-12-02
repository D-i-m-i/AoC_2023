# input_file = File.open('trebuchet.txt', 'r')
# lines = input_file.readlines

# sum = 0

# lines.each do |line|
#   line = line.scan(/\d/).join('')
#   if line.length == 1
#     sum += (line[0] + line[0]).to_i
#   elsif line.length > 1
#     sum += (line[0] + line[-1]).to_i
#   end
# end

# puts sum

# read each line
# read each character in the line
# check if its a number
# if a number save as the first number
# if not a number check the char
# if it belogns in  o, t, f, s, e, n keep checking the next and the next

# read each line
# scan for words
# if word found record its index position
# scan for numbers
# if number found record its index position
# compare index positions

input_file = File.open('trebuchet.txt', 'r')
lines = input_file.readlines

sum = 0

lines.each do |test_line|
  # puts test_line
  # if test_line.scan('one').length > 0
  indexes = []
  numbers = []

  if test_line.index('one').is_a? Integer
    index_one = test_line.index('one')
    indexes.append(index_one)
    numbers.append(1)
  end

  if test_line.index('two').is_a? Integer
    index_two = test_line.index('two')
    indexes.append(index_two)
    numbers.append(2)
  end

  if test_line.index('three').is_a? Integer
    index_three = test_line.index('three')
    indexes.append(index_three)
    numbers.append(3)
  end

  if test_line.index('four').is_a? Integer
    index_four = test_line.index('four')
    indexes.append(index_four)
    numbers.append(4)
  end

  if test_line.index('five').is_a? Integer
    index_five = test_line.index('five')
    indexes.append(index_five)
    numbers.append(5)
  end

  if test_line.index('six').is_a? Integer
    index_six = test_line.index('six')
    indexes.append(index_six)
    numbers.append(6)
  end

  if test_line.index('seven').is_a? Integer
    index_seven = test_line.index('seven')
    indexes.append(index_seven)
    numbers.append(7)
  end

  if test_line.index('eight').is_a? Integer
    index_eight = test_line.index('eight')
    indexes.append(index_eight)
    numbers.append(8)
  end

  if test_line.index('nine').is_a? Integer
    index_nine = test_line.index('nine')
    indexes.append(index_nine)
    numbers.append(9)
  end

  if test_line.index('1').is_a? Integer
    index_one_num = test_line.index('1')
    indexes.append(index_one_num)
    numbers.append(1)
  end

  if test_line.index('2').is_a? Integer
    index_two_num = test_line.index('2')
    indexes.append(index_two_num)
    numbers.append(2)
  end

  if test_line.index('3').is_a? Integer
    index_three_num = test_line.index('3')
    indexes.append(index_three_num)
    numbers.append(3)
  end

  if test_line.index('4').is_a? Integer
    index_four_num = test_line.index('4')
    indexes.append(index_four_num)
    numbers.append(4)
  end

  if test_line.index('5').is_a? Integer
    index_five_num = test_line.index('5')
    indexes.append(index_five_num)
    numbers.append(5)
  end

  if test_line.index('6').is_a? Integer
    index_six_num = test_line.index('6')
    indexes.append(index_six_num)
    numbers.append(6)
  end

  if test_line.index('7').is_a? Integer
    index_seven_num = test_line.index('7')
    indexes.append(index_seven_num)
    numbers.append(7)
  end

  if test_line.index('8').is_a? Integer
    index_eight_num = test_line.index('8')
    indexes.append(index_eight_num)
    numbers.append(8)
  end

  if test_line.index('9').is_a? Integer
    index_nine_num = test_line.index('9')
    indexes.append(index_nine_num)
    numbers.append(9)
  end

  # print indexes
  index_min = indexes.index(indexes.min)
  # print index_min
  index_max = indexes.index(indexes.max)
  # print index_max
  # print numbers[index_min]
  # print numbers[index_max]
  # print numbers
  # print indexes
  sum += (numbers[index_min] + numbers[index_max])
end

puts sum

# puts test_line.index('five').class

# puts test_line.scan('one').length
# puts test_line.scan('one').index('one').class
# puts test_line.scan('five').index('five')
# puts test_line.index('four')

# test_line.each_char do |letter|
#   puts letter
# end

# puts test_line

# lines.each do |line|
#   line = line.scan(/\d/).join('')
#   if line.length == 1
#     sum += (line[0] + line[0]).to_i
#   elsif line.length > 1
#     sum += (line[0] + line[-1]).to_i
#   end
# end

# puts sum
