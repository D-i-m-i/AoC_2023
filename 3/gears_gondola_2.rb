# FILE IS LOADED AND READY FOR ACTION
input_file = File.open('input.txt', 'r')
# input_file = File.open('example.txt', 'r')

# CREATE AN ARRAY MADE OUT OF EACH LINE, STRIPPED OF NEWLINES \n
file_lines = input_file.readlines.map(&:strip)

# HAVE THE INPUT AS A SINGLE STRING
# file_string = File.open('example.txt', 'r').read.split(/\n/).join
file_string = File.open('input.txt', 'r').read.split(/\n/).join

# FIGURE OUT THE SYMBOLS
symbols = []
file_string.scan(/[^0-9.]/) do |symbol|
  symbols.append(symbol) unless symbols.include?(symbol)
end
p symbols

selected_nos = []

line_number = 1
# ITERATE OVER EACH LINE
file_lines.each do |line|
  # line = file_lines[37]
  puts "Line is #{line} and it is line #{line_number}"
  line_number += 1
  previous_line = file_lines[(file_lines.index(line) - 1).abs] # use abs to deal with the scenario of the first line
  p "previous line is #{previous_line}"
  next_line = file_lines[(file_lines.index(line) + 1).abs]
  p "next line is #{next_line}"

  # ITERATE EVERY NUMBER FOUND
  line.scan(/\d+/) do |number|
    puts "Number is #{number}"
    # index = line.index(number)
    index = line.enum_for(:scan, /\b#{number}\b/).map { Regexp.last_match.begin(0) }[0]
    p "number index is #{index}"
    number_length = number.length
    p "length of number is #{number_length}"

    if index.zero? # DEALING WITH NUMBERS AT THE BEGINNING OF LINES
      check_span = index..(index + number_length)
    else
      check_span = (index - 1)..(index + number_length)
    end
    p "check span is #{check_span}"

    # CHECK THE PREVIOUS LINE AT THE POSITIONS FROM LEFT OF NUMBER ALL THE WAY TO THE RIGHT OF NUMBER
    prev_positions = previous_line[check_span]
    p "previous positions are #{prev_positions}"

    # CHECK THE CURRENT LINE AT THE POSITIONS FROM LEFT OF NUMBER ALL THE WAY TO THE RIGHT OF NUMBER
    current_positions = line[check_span]
    p "current positions are #{current_positions}"

    # CHECK THE NEXT LINE AT THE POSITIONS FROM LEFT OF NUMBER ALL THE WAY TO THE RIGHT OF NUMBER
    unless next_line.nil?
      next_positions = next_line[check_span]
    else
      next_positions = ''
    end
    p "next positions are #{next_positions}"

    all_targets = prev_positions + current_positions + next_positions
    p all_targets
    checks = all_targets.match(/[-*&$@\/#=%+]+/)
    p "the results is #{checks}"

    selected_nos.append(number) unless checks.nil?
  puts "**********************************************************************************"
  end
end
selected_nos = selected_nos.map(&:to_i)
p "Lucky numbers selected are #{selected_nos}"
p "Sum is #{selected_nos.sum}"
