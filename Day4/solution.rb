# lines = File.readlines('Day4\testInput.txt', chomp: true)
lines = File.readlines('Day4\input.txt', chomp: true)

matching_nums = []
points = 0
card_list = {}

lines.each_with_index do |l, index|
    scores = l.split(":")[1]
    win_list, my_list = scores.split("|")
    winning_nums = win_list.scan(/[0-9]+/).flatten.map(&:to_i)
    my_nums = my_list.scan(/[0-9]+/).flatten.map(&:to_i)
    matching_nums.append(my_nums.intersection(winning_nums))
    card_list[index] = 1
end

matching_nums.each_with_index do |n, index|
    if n.empty?
        next
    end
    points += 2**(n.size-1)
    for i in [*index+1..index+n.size]
        card_list[i] += 1*card_list[index]
    end
end

puts "Part 1 - #{points}"
puts "Part 2 - #{card_list.values.inject(:+)}"