#lines = File.readlines('Day7\testInput.txt', chomp: true)
lines = File.readlines('Day7\input.txt', chomp: true)

five_of_a_kinds = []
four_of_a_kinds = []
full_houses = []
three_of_a_kinds = []
two_pairs = []
one_pairs = []
high_cards = []
five_of_a_kinds2 = []
four_of_a_kinds2 = []
full_houses2 = []
three_of_a_kinds2 = []
two_pairs2 = []
one_pairs2 = []
high_cards2 = []
total_winnings = 0
replacement_for_sort = {
    'A' => 'Z',
    'K' => 'Y',
    'Q' => 'X',
    'J' => 'W',
    'T' => 'V'
}

for l in lines
    hand, bid = l.gsub(Regexp.union(replacement_for_sort.keys), replacement_for_sort).split(" ")
    bid = bid.to_i
    hand_count = hand.each_char.inject(Hash.new(0)) {|a,c| a[c] += 1; a}
    hand_count = Hash[hand_count.sort_by {|_, v| -v}]
    hand2 = hand.gsub(/W/, "0")
    if hand_count.keys[0] == "W" and hand_count.values[0] != 5
        jhand = hand.gsub(/W/, hand_count.keys[1])
    else
        jhand = hand.gsub(/W/, hand_count.keys[0])
    end
    jhand_count = jhand.each_char.inject(Hash.new(0)) {|a,c| a[c] += 1; a}
    jhand_count = Hash[jhand_count.sort_by {|_, v| -v}]
    curr_hand = {"hand": hand, "bid": bid}
    curr_hand2 = {"jhand": jhand, "hand": hand2, "bid": bid}
    if hand_count.values[0] == 5
        five_of_a_kinds.append(curr_hand)
    elsif hand_count.values[0] == 4
        four_of_a_kinds.append(curr_hand)
    elsif hand_count.values[0] == 3 and hand_count.values[1] == 2
        full_houses.append(curr_hand)
    elsif hand_count.values[0] == 3
        three_of_a_kinds.append(curr_hand)
    elsif hand_count.values[0] == 2 and hand_count.values[1] == 2
        two_pairs.append(curr_hand)
    elsif hand_count.values[0] == 2 and hand_count.values[1] == 1
        one_pairs.append(curr_hand)
    else
        high_cards.append(curr_hand)
    end
    if jhand_count.values[0] == 5
        five_of_a_kinds2.append(curr_hand2)
    elsif jhand_count.values[0] == 4
        four_of_a_kinds2.append(curr_hand2)
    elsif jhand_count.values[0] == 3 and jhand_count.values[1] == 2
        full_houses2.append(curr_hand2)
    elsif jhand_count.values[0] == 3
        three_of_a_kinds2.append(curr_hand2)
    elsif jhand_count.values[0] == 2 and jhand_count.values[1] == 2
        two_pairs2.append(curr_hand2)
    elsif jhand_count.values[0] == 2 and jhand_count.values[1] == 1
        one_pairs2.append(curr_hand2)
    else
        high_cards2.append(curr_hand2)
    end
end

high_cards = high_cards.sort_by {|h| h[:"hand"]}
one_pairs = one_pairs.sort_by {|h| h[:"hand"]}
two_pairs = two_pairs.sort_by {|h| h[:"hand"]}
three_of_a_kinds = three_of_a_kinds.sort_by {|h| h[:"hand"]}
full_houses = full_houses.sort_by {|h| h[:"hand"]}
four_of_a_kinds = four_of_a_kinds.sort_by {|h| h[:"hand"]}
five_of_a_kinds = five_of_a_kinds.sort_by {|h| h[:"hand"]}

high_cards2 = high_cards2.sort_by {|h| h[:"hand"]}
one_pairs2 = one_pairs2.sort_by {|h| h[:"hand"]}
two_pairs2 = two_pairs2.sort_by {|h| h[:"hand"]}
three_of_a_kinds2 = three_of_a_kinds2.sort_by {|h| h[:"hand"]}
full_houses2 = full_houses2.sort_by {|h| h[:"hand"]}
four_of_a_kinds2 = four_of_a_kinds2.sort_by {|h| h[:"hand"]}
five_of_a_kinds2 = five_of_a_kinds2.sort_by {|h| h[:"hand"]}

#puts four_of_a_kinds2
rank = 1

high_cards.each {|h| total_winnings += h[:"bid"]*rank; rank += 1}
one_pairs.each {|h| total_winnings += h[:"bid"]*rank; rank += 1}
two_pairs.each {|h| total_winnings += h[:"bid"]*rank; rank += 1}
three_of_a_kinds.each {|h| total_winnings += h[:"bid"]*rank; rank += 1}
full_houses.each {|h| total_winnings += h[:"bid"]*rank; rank += 1}
four_of_a_kinds.each {|h| total_winnings += h[:"bid"]*rank; rank += 1}
five_of_a_kinds.each {|h| total_winnings += h[:"bid"]*rank; rank += 1}

puts "Part 1: #{total_winnings}"
rank = 1
total_winnings = 0

high_cards2.each {|h| total_winnings += h[:"bid"]*rank; rank += 1}
one_pairs2.each {|h| total_winnings += h[:"bid"]*rank; rank += 1}
two_pairs2.each {|h| total_winnings += h[:"bid"]*rank; rank += 1}
three_of_a_kinds2.each {|h| total_winnings += h[:"bid"]*rank; rank += 1}
full_houses2.each {|h| total_winnings += h[:"bid"]*rank; rank += 1}
four_of_a_kinds2.each {|h| total_winnings += h[:"bid"]*rank; rank += 1}
five_of_a_kinds2.each {|h| total_winnings += h[:"bid"]*rank; rank += 1}

puts "Part 2: #{total_winnings}"