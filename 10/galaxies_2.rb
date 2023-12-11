require 'set'

# FILE IS LOADED AND READY FOR ACTION
input_file = File.open('input.txt', 'r')

expanded_rows = []
# **EXPANSION**
# SAVE UNIVERSE INTO A NESTED ARRAY
image = input_file.readlines.map(&:strip)

# ITERATE OVER ROWS AND ADD AN EMPTY ROW NEXT TO EACH EMPTY ROW FOUND
image.each do |row|
  if row.chars.uniq.length == 1
    1_000_000.times do |_|
      expanded_rows.append(row)
    end
  else
    expanded_rows.append(row)
  end
end

# ITERATE OVER SAME ELEMENT OF EACH ROW (COLUMN) AND IF ALL '.' ADD AN ELEMENT NEXT TO THESE ELEMENTS
# ITERATE OVER EACH ROW
final_expansion = []
indexes_to_append = []

for index in 0..(expanded_rows[0].length - 1)
  temp_column = []
  expanded_rows.each do |row|
    temp_column.append(row[index])
  end

  # check if all elements are the same (in this case if all are '.')
  indexes_to_append.append(index) if temp_column.uniq.length == 1
end

expanded_rows.each do |row|
  row = row.chars
  indexes_to_append.each_with_index do |index_current, index|
    adjusted_index = index_current + index
    1..999999.times do |_|
      row.insert(adjusted_index, '.')
    end
  end
  final_expansion.append(row.join)
end

puts "final expansion is"
pp final_expansion
# iterate over each element
# if unique add an '.' next to them

galaxies = {}
# **DISTANCES**
# RECORD THE LOCATION OF EACH GALAXY. CAN CREATE A NESTED ARRAY OF COORDINATES
galaxy_id = 1
final_expansion.each_with_index do |row, y_index|
  row.chars.each_with_index do |image_element, x_index|
    if image_element === '#'
      galaxies[galaxy_id] = { x_coord: x_index + 1, y_coord: y_index + 1 }
      galaxy_id += 1
    end
  end
end

pp galaxies

# DO COMPARISONS BETWEEN ALL GALAXIES TO SAVE THE SHORTEST DISTANCE
galaxy_pairs = galaxies.keys.combination(2).to_a

paths = []
galaxy_pairs.each do |pair|
  pair_id_one = pair[0]
  pair_id_two = pair[1]
  galaxy_one_x = galaxies[pair_id_one][:x_coord]
  galaxy_two_x = galaxies[pair_id_two][:x_coord]
  galaxy_one_y = galaxies[pair_id_one][:y_coord]
  galaxy_two_y = galaxies[pair_id_two][:y_coord]
  x_diff = (galaxy_one_x - galaxy_two_x).abs
  y_diff = (galaxy_one_y - galaxy_two_y).abs
  path = x_diff + y_diff
  paths << path
end

p paths.sum
