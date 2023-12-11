#lines = File.readlines('Day10\testInput.txt', chomp: true)
lines = File.readlines('Day10\input.txt', chomp: true)

map = []
pos = [0, 0]
steps = 0
ground_tiles = []

lines.each_with_index do |l, row|
    curr_row = []
    l.split("").each_with_index do |c, col|
        if c.match(/S/)
            pos[0] = row
            pos[1] = col
        elsif c.match(/\./)
            ground_tiles.append([row, col])
        end
        curr_row.append(c)
    end
    map.append(curr_row)
end

current_pipe = "S"
came_from = nil

loop do
    loop_pipes.append(pos.dup)
    moved = false
    adj_pipe = nil
    # Move left
    if pos[1] != 0 and current_pipe.match(/[-SJ7]/) and came_from != "R"
        adj_pipe = map[pos[0]][pos[1]-1]
        if adj_pipe.match(/[\-FL]/)
            pos[1] = pos[1]-1
            moved = true
            came_from = "L"
        end
    end
    # Move down
    if not moved and pos[0] != map.length-1 and current_pipe.match(/[S|F7]/) and came_from != "U"
        adj_pipe = map[pos[0]+1][pos[1]]
        if adj_pipe.match(/[|LJ]/)
            pos[0] = pos[0]+1
            moved = true
            came_from = "D"
        end
    end
    # Move right
    if not moved and pos[1] != map[0].length-1 and current_pipe.match(/[-SFL]/) and came_from != "L"
        adj_pipe = map[pos[0]][pos[1]+1]
        if adj_pipe.match(/[-J7]/)
            pos[1] = pos[1]+1
            moved = true
            came_from = "R"
        end
    end
    # Move up
    if not moved and pos[0] != 0 and current_pipe.match(/[S|JL]/) and came_from != "D"
        adj_pipe = map[pos[0]-1][pos[1]]
        if adj_pipe.match(/[|F7]/)
            pos[0] = pos[0]-1
            came_from = "U"
        end
    end
    current_pipe = adj_pipe
    steps += 1
    if current_pipe == "S"
        break
    end
end

p steps/2