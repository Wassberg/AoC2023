# lines = File.readlines 'Day2\testInput.txt'
lines = File.readlines 'Day2\input.txt'

MAX_CUBES = {
    "red": 12,
    "green": 13,
    "blue": 14
}
possible_games = []
power_list = []

lines.each.with_index(1) do |l, index|
    reds = l.scan(/([0-9]+) red/).flatten.map(&:to_i)
    greens = l.scan(/([0-9]+) green/).flatten.map(&:to_i)
    blues = l.scan(/([0-9]+) blue/).flatten.map(&:to_i)

    power = reds.max * greens.max * blues.max
    power_list.append(power)

    if reds.max > MAX_CUBES[:red] or greens.max > MAX_CUBES[:green] or blues.max > MAX_CUBES[:blue]
        next
    end
    possible_games.append(index)
end

puts "Part 1: #{possible_games.sum}"
puts "Part 2: #{power_list.sum}"