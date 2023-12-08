require 'pp'

# FILE IS LOADED AND READY FOR ACTION
input_file = File.open('input.txt', 'r')
lines = input_file.readlines

# STORE EACH HAND INTO A HASH OF HASHES
hands_five = Hash.new(0)
hands_four = Hash.new(0)
hands_full = Hash.new(0)
hands_three = Hash.new(0)
hands_two_pair = Hash.new(0)
hands_one_pair = Hash.new(0)
hands_high = Hash.new(0)

total_winnings = 0
hand_no = 1

# ITERATE OVER EACH HAND AND CREATE HASHES POPULATED WITH USEFUL INFO
lines.each do |line|
  hand_hash = Hash.new(0)
  hand = line.split[0]
  bid = line.split[1].to_i
  hand.each_char do |card|
    hand_hash[card] += 1
  end

  hash_length = hand_hash.length
  max_count = hand_hash.values.max

  # pp hand_hash

  hand_hash['hand'] = hand
  hand_hash['bid'] = bid
  if hash_length == 1
    hand_hash['type'] = "7 Five of a kind!"
    hands_five[hand_no.to_s] = hand_hash
  elsif hash_length == 2 && max_count == 4
    # puts "J is #{hand_hash['J']}"
    if hand_hash['J'] == 1
      hand_hash['type'] = "7 Five of a kind! JOKER"
      hands_five[hand_no.to_s] = hand_hash
    else
      hand_hash['type'] = "6 Four of a kind!"
      hands_four[hand_no.to_s] = hand_hash
    end
  elsif hash_length == 2 && max_count == 3
    if hand_hash['J'] == 2
      hand_hash['type'] = "7 Five of a kind! JOKER"
      hands_five[hand_no.to_s] = hand_hash
    elsif hand_hash['J'] == 1
      hand_hash['type'] = "7 Four of a kind! JOKER"
      hands_four[hand_no.to_s] = hand_hash
    else
      hand_hash['type'] = "5 Full House!"
      hands_full[hand_no.to_s] = hand_hash
    end
  elsif hash_length == 3 && max_count == 3
    if hand_hash['J'] == 1
      hand_hash['type'] = "7 Four of a kind! JOKER"
      hands_four[hand_no.to_s] = hand_hash
    else
      hand_hash['type'] = "4 Three of a kind!"
      hands_three[hand_no.to_s] = hand_hash
    end
  elsif hash_length == 3 && max_count == 2
    if hand_hash['J'] == 2
      hand_hash['type'] = "7 Four of a kind! JOKER"
      hands_four[hand_no.to_s] = hand_hash
    elsif hand_hash['J'] == 1
      hand_hash['type'] = "7 Full House! JOKER"
      hands_full[hand_no.to_s] = hand_hash
    else
      hand_hash['type'] = "3 Two pair!"
      hands_two_pair[hand_no.to_s] = hand_hash
    end
  elsif hash_length == 4
    if hand_hash['J'] == 1
      hand_hash['type'] = "7 Two pair! JOKER"
      hands_two_pair[hand_no.to_s] = hand_hash
    else
      hand_hash['type'] = "2 One pair!"
      hands_one_pair[hand_no.to_s] = hand_hash
    end
  elsif hash_length == 5
    if hand_hash['J'] == 1
      hand_hash['type'] = "7 One pair! JOKER"
      hands_one_pair[hand_no.to_s] = hand_hash
    else
      hand_hash['type'] = "1 High card!"
      hands_high[hand_no.to_s] = hand_hash
    end
  end

  hand_no += 1
end

# strength_order = {'A' => 1, 'K' => 2, 'Q' => 3, 'J' => 4, 'T' => 5, '9' => 6, '8' => 7, '7' => 8, '6' => 9, '5' => 10, '4' => 11, '3' => 12, '2' => 13 }

# REVISED ORDER
strength_order = {'A' => 1, 'K' => 2, 'Q' => 3, 'T' => 4, '9' => 5, '8' => 6, '7' => 7, '6' => 8, '5' => 9, '4' => 10, '3' => 11, '2' => 12, 'J' => 13 }

# SORTING METHOD
def sorting_hashes(hash, strength_order)
  hash.sort_by do |_, subhash|
    subhash['hand'].chars.map { |char| strength_order[char] }
  end.to_h
end

# SORTING THE HASHES BASE ON THE 'HAND' VALUE AND STRENGTH ORDER
sorted_hands_five = sorting_hashes(hands_five, strength_order)
sorted_hands_four = sorting_hashes(hands_four, strength_order)
sorted_hands_full = sorting_hashes(hands_full, strength_order)
sorted_hands_three = sorting_hashes(hands_three, strength_order)
sorted_hands_two_pair = sorting_hashes(hands_two_pair, strength_order)
sorted_hands_one_pair = sorting_hashes(hands_one_pair, strength_order)
sorted_hands_high = sorting_hashes(hands_high, strength_order)

# CREATING A SINGLE HASH CONTAINING ALL SORTED HASHES WITH THE CORRECT ORDER OF PRIORITY
sorted_hands_all = sorted_hands_five.merge(sorted_hands_four).merge(sorted_hands_full).merge(sorted_hands_three).merge(sorted_hands_two_pair).merge(sorted_hands_one_pair).merge(sorted_hands_high)

rank = lines.length
sorted_hands_all.each do |_, subhash|
  subhash['rank'] = rank
  rank -= 1
end

sorted_hands_all.each do |_, value|
  winnings = value['rank'] * value['bid']
  total_winnings += winnings
end

pp sorted_hands_all
p total_winnings
