# FILE IS LOADED AND READY FOR ACTION
# input_file = File.open('example.txt', 'r')
input_file = File.open('input.txt', 'r')
lines = input_file.readlines.map(&:strip)

total = 0
lines.each do |line|
  # CREATE THE ARRAY OF WINNING NUMBERS
  winning_nos = line.split('|')[0].split(':')[1].split
  p winning_nos

  # CREATE THE ARRAY OF NUMBERS YOU HAVE
  card_numbers = line.split('|')[1].split
  p card_numbers

  # INTERSECT ARRAYS TO GET MATCHES
  p matches = (winning_nos & card_numbers).length

  points = matches.zero? ? 0 : 2**(matches - 1)
  total += points
end
p "Total is #{total}"
