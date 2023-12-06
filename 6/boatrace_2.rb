# THERE ARE THE INPUTS
times = 4_685_758_2
record_dist = 2_081_412_125_714_10

product = 1
no_ways = 0
(0..times).each do |current_time|
  no_ways += 1 if ((times - current_time) * current_time) > record_dist
end
p product * no_ways
