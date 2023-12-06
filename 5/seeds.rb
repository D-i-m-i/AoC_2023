# # FILE IS LOADED AND READY FOR ACTION
# input_file = File.open('input.txt', 'r')
# lines = input_file.readlines


# Define the maps
seed_to_soil_map = [[50, 98, 2], [52, 50, 48]]
soil_to_fertilizer_map = [[0, 15, 37], [37, 52, 2], [39, 0, 15]]
fertilizer_to_water_map = [[49, 53, 8], [0, 11, 42], [42, 0, 7], [57, 7, 4]]
water_to_light_map = [[88, 18, 7], [18, 25, 70]]
light_to_temperature_map = [[45, 77, 23], [81, 45, 19], [68, 64, 13]]
temperature_to_humidity_map = [[0, 69, 1], [1, 0, 69]]
humidity_to_location_map = [[60, 56, 37], [56, 93, 4]]

# Initial seed numbers
initial_seeds = [79, 14, 55, 13]

# Function to perform the conversion
def convert_seed_to_location(seed)
  soil = seed

  seed_to_soil_map.each do |start_dest, start_source, length|
    if start_source <= soil && soil < start_source + length
      soil = start_dest + (soil - start_source)
      break
    end
  end

  soil_to_fertilizer_map.each do |start_dest, start_source, length|
    if start_source <= soil && soil < start_source + length
      soil = start_dest + (soil - start_source)
      break
    end
  end

  fertilizer_to_water_map.each do |start_dest, start_source, length|
    if start_source <= soil && soil < start_source + length
      soil = start_dest + (soil - start_source)
      break
    end
  end

  water_to_light_map.each do |start_dest, start_source, length|
    if start_source <= soil && soil < start_source + length
      soil = start_dest + (soil - start_source)
      break
    end
  end

  light_to_temperature_map.each do |start_dest, start_source, length|
    if start_source <= soil && soil < start_source + length
      soil = start_dest + (soil - start_source)
      break
    end
  end

  temperature_to_humidity_map.each do |start_dest, start_source, length|
    if start_source <= soil && soil < start_source + length
      soil = start_dest + (soil - start_source)
      break
    end
  end

  humidity_to_location_map.each do |start_dest, start_source, length|
    if start_source <= soil && soil < start_source + length
      return start_dest + (soil - start_source)
    end
  end
end

# Find the lowest location number
lowest_location = initial_seeds.map { |seed| convert_seed_to_location(seed) }.min
puts lowest_location
