lines = File.readlines('Day8\testInput.txt', chomp: true)
# lines = File.readlines('Day8\input.txt', chomp: true)

instructions = lines[0].split("")
node_map = []
current_node = "AAA"
starting_nodes = []
TARGET_NODE = "ZZZ"
instruction_index = 0
steps = 0

lines[2..-1].each do |l|
    node, left, right = l.scan(/[A-Z0-9]{3}/)
    node_map.append({"node":node, "L":left, "R":right})
end

while current_node != TARGET_NODE
    if instruction_index == instructions.length
        instruction_index = 0
    end
    current_node = node_map.find {|n| n[:"node"] == current_node}[:"#{instructions[instruction_index]}"]
    instruction_index += 1
    steps += 1
end

puts steps