#lines = File.readlines('Day9\testInput.txt', chomp: true)
lines = File.readlines('Day9\input.txt', chomp: true)

ex_vals_end = []
ex_vals_start = []

for l in lines
    history = l.scan(/-?[0-9]+/).map(&:to_i)
    sequences = [history]
    while not sequences[-1].all? {|s| s == sequences[-1][0]}
        new_sequence = []
        sequences[-1][1..-1].each_with_index do |v, index|
            new_sequence.append(v - sequences[-1][index])
        end
        sequences.append(new_sequence)
    end
    sequences = sequences.reverse()
    sequences[0..-2].each_with_index do |s, index|
        sequences[index+1].append(sequences[index+1][-1] + s[-1])
        sequences[index+1] = [(sequences[index+1][0] - sequences[index][0])] + sequences[index+1]
    end
    ex_vals_start.append(sequences[-1][0])
    ex_vals_end.append(sequences[-1][-1])
end

puts "Part 1: #{ex_vals_end.sum}"
puts "Part 2: #{ex_vals_start.sum}"