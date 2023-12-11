#lines = File.readlines('Day8\testInput2.txt', chomp: true)
lines = File.readlines('Day8\input.txt', chomp: true)

instructions = lines[0].split("")
node_map = []
current_nodes = []
instruction_index = 0
steps = []
step = 1

lines[2..-1].each do |l|
    node, left, right = l.scan(/[A-Z0-9]{3}/)
    node_map.append({"node":node, "L":left, "R":right})
    if node.match(/[A-Z0-9]{2}A/)
        current_nodes.append(node)
        steps.append(0)
    end
end

while not steps.all?{|s| s > 0}
    if instruction_index == instructions.length
        instruction_index = 0
    end
    current_nodes.each_with_index do |node, index|
        current_nodes[index] = node_map.find{|n| n[:"node"] == node}[:"#{instructions[instruction_index]}"]
        if current_nodes[index].match(/[A-Z0-9]{2}Z/)
            steps[index] = step
        end
    end
    
    instruction_index += 1
    step += 1
end

puts steps.reduce(1, :lcm)