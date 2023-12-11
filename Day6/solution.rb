#lines = File.readlines('Day6\testInput.txt', chomp: true)
lines = File.readlines('Day6\input.txt', chomp: true)

time = []
times = []
distance = []
distances = []
record_runs = []
record_runs_2 = 0

for l in lines
    if l.match(/Time: */)
        times = l.scan(/[0-9]+/).flatten.map(&:to_i)
        time = l.scan(/[0-9]+/).flatten.join('').to_i
    end
    if l.match(/Distance: */)
        distances = l.scan(/[0-9]+/).flatten.map(&:to_i)
        distance = l.scan(/[0-9]+/).flatten.join('').to_i
    end
end

times.each_with_index do |t, index|
    r = 0
    [*1..t-1].each do |n|
        if n*(t-n) > distances[index]
            r += 1
        end
    end
    record_runs.append(r)
end

[*1..time-1].each do |n|
    if n*(time-n) > distance
        record_runs_2 += 1
    end
end

puts "Part 1 #{record_runs.inject(:*)}"
puts "Part 2 #{record_runs_2}"