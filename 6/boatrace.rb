# THESE ARE THE INPUTS
times = [46, 85, 75, 82]
record_dists = [208, 1412, 1257, 1410]

product = 1
times.each do |time|
  no_ways = 0
  (0..time).each do |current_time|
    no_ways += 1 if ((time - current_time) * current_time) > record_dists[times.index(time)]
  end
  p product *= no_ways
end
