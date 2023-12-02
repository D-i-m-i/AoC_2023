# read each line
# find indexes of matching numbers, either by word or by number
# if word found record its index position
# do an index comparison to get the leftmost and rightmost numbers
# sum up

input_file = File.open('trebuchet.txt', 'r')
lines = input_file.readlines

sum = 0
run = 0

lines.each do |test_line|
  puts test_line
  index_min = 100
  index_max = 0
  first_num = 0
  second_num = 0

  index_one_num = test_line.index('1')
  index_two_num = test_line.index('2')
  index_three_num = test_line.index('3')
  index_four_num = test_line.index('4')
  index_five_num = test_line.index('5')
  index_six_num = test_line.index('6')
  index_seven_num = test_line.index('7')
  index_eight_num = test_line.index('8')
  index_nine_num = test_line.index('9')

  index_one = test_line.index('one')
  index_two = test_line.index('two')
  index_three = test_line.index('three')
  index_four = test_line.index('four')
  index_five = test_line.index('five')
  index_six = test_line.index('six')
  index_seven = test_line.index('seven')
  index_eight = test_line.index('eight')
  index_nine = test_line.index('nine')

  if index_one_num.is_a? Integer
    index_min = index_one_num
    first_num = 1
  end

  if index_two_num.is_a? Integer
    if index_two_num < index_min
      index_min = index_two_num
      first_num = 2
    end
  end

  if index_three_num.is_a? Integer
    if index_three_num < index_min
      index_min = index_three_num
      first_num = 3
    end
  end

  if index_four_num.is_a? Integer
    if index_four_num < index_min
      index_min = index_four_num
      first_num = 4
    end
  end

  if index_five_num.is_a? Integer
    if index_five_num < index_min
      index_min = index_five_num
      first_num = 5
    end
  end

  if index_six_num.is_a? Integer
    if index_six_num < index_min
      index_min = index_six_num
      first_num = 6
    end
  end

  if index_seven_num.is_a? Integer
    if index_seven_num < index_min
      index_min = index_seven_num
      first_num = 7
    end
  end

  if index_eight_num.is_a? Integer
    if index_eight_num < index_min
      index_min = index_eight_num
      first_num = 8
    end
  end

  if index_nine_num.is_a? Integer
    if index_nine_num < index_min
      index_min = index_nine_num
      first_num = 9
    end
  end

  if index_one.is_a? Integer
    if index_one < index_min
      index_min = index_one
      first_num = 1
    end
  end

  if index_two.is_a? Integer
    if index_two < index_min
      index_min = index_two
      first_num = 2
    end
  end

  if index_three.is_a? Integer
    if index_three < index_min
      index_min = index_three
      first_num = 3
    end
  end

  if index_four.is_a? Integer
    if index_four < index_min
      index_min = index_four
      first_num = 4
    end
  end

  if index_five.is_a? Integer
    if index_five < index_min
      index_min = index_five
      first_num = 5
    end
  end

  if index_six.is_a? Integer
    if index_six < index_min
      index_min = index_six
      first_num = 6
    end
  end

  if index_seven.is_a? Integer
    if index_seven < index_min
      index_min = index_seven
      first_num = 7
    end
  end

  if index_eight.is_a? Integer
    if index_eight < index_min
      index_min = index_eight
      first_num = 8
    end
  end

  if index_nine.is_a? Integer
    if index_nine < index_min
      index_min = index_nine
      first_num = 9
    end
  end

  puts 'FIRST NUM IS'
  puts first_num
  puts 'INDEX MIN IS'
  puts index_min

  index_one_num = test_line.rindex('1')
  index_two_num = test_line.rindex('2')
  index_three_num = test_line.rindex('3')
  index_four_num = test_line.rindex('4')
  index_five_num = test_line.rindex('5')
  index_six_num = test_line.rindex('6')
  index_seven_num = test_line.rindex('7')
  index_eight_num = test_line.rindex('8')
  index_nine_num = test_line.rindex('9')

  index_one = test_line.rindex('one')
  index_two = test_line.rindex('two')
  index_three = test_line.rindex('three')
  index_four = test_line.rindex('four')
  index_five = test_line.rindex('five')
  index_six = test_line.rindex('six')
  index_seven = test_line.rindex('seven')
  index_eight = test_line.rindex('eight')
  index_nine = test_line.rindex('nine')

  if index_one_num.is_a? Integer
    index_max = index_one_num
    second_num = 1
  end

  if index_two_num.is_a? Integer
    if index_two_num > index_max
      index_max = index_two_num
      second_num = 2
    end
  end

  if index_three_num.is_a? Integer
    if index_three_num > index_max
      index_max = index_three_num
      second_num = 3
    end
  end

  if index_four_num.is_a? Integer
    if index_four_num > index_max
      index_max = index_four_num
      second_num = 4
    end
  end

  if index_five_num.is_a? Integer
    if index_five_num > index_max
      index_max = index_five_num
      second_num = 5
    end
  end

  if index_six_num.is_a? Integer
    if index_six_num > index_max
      index_max = index_six_num
      second_num = 6
    end
  end

  if index_seven_num.is_a? Integer
    if index_seven_num > index_max
      index_max = index_seven_num
      second_num = 7
    end
  end

  if index_eight_num.is_a? Integer
    if index_eight_num > index_max
      index_max = index_eight_num
      second_num = 8
    end
  end

  if index_nine_num.is_a? Integer
    if index_nine_num > index_max
      index_max = index_nine_num
      second_num = 9
    end
  end

  if index_one.is_a? Integer
    if index_one > index_max
      index_max = index_one
      second_num = 1
    end
  end

  if index_two.is_a? Integer
    if index_two > index_max
      index_max = index_two
      second_num = 2
    end
  end

  if index_three.is_a? Integer
    if index_three > index_max
      index_max = index_three
      second_num = 3
    end
  end

  if index_four.is_a? Integer
    if index_four > index_max
      index_max = index_four
      second_num = 4
    end
  end

  if index_five.is_a? Integer
    if index_five > index_max
      index_max = index_five
      second_num = 5
    end
  end

  if index_six.is_a? Integer
    if index_six > index_max
      index_max = index_six
      second_num = 6
    end
  end

  if index_seven.is_a? Integer
    if index_seven > index_max
      index_max = index_seven
      second_num = 7
    end
  end

  if index_eight.is_a? Integer
    if index_eight > index_max
      index_max = index_eight
      second_num = 8
    end
  end

  if index_nine.is_a? Integer
    if index_nine > index_max
      index_max = index_nine
      second_num = 9
    end
  end

  first_num = second_num if first_num.zero?
  second_num = first_num if second_num.zero?

  puts 'SECOND NUM IS'
  puts second_num
  puts 'INDEX MAX IS'
  puts index_max
  small_sum = (first_num.to_s + second_num.to_s).to_i
  puts "SMALL SUM is #{small_sum} and it has a class of #{small_sum.class}"
  sum += small_sum
  puts "TOTAL SUM is #{sum}"
  run += 1
  puts 'RUN'
  puts run
end

puts 'SUM IS'
puts sum
