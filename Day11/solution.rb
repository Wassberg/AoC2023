#lines = File.readlines('Day11\testInput.txt', chomp: true)
lines = File.readlines('Day11\input.txt', chomp: true)

galaxy_map = []
columns_to_expand = [*0..lines[0].length-1]
rows_to_expand = []
total_dist = 0
EXPANSION_MULTIPLIER = 2

lines.each_with_index do |l, index|  
    if l.match(/^\.+$/)
        rows_to_expand.append(index)
        next
    end
    no_expand = l.enum_for(:scan, /(?=#)/).map do
        galaxy_map.append([index, Regexp.last_match.offset(0).first])
        Regexp.last_match.offset(0).first
    end
    columns_to_expand -= no_expand
end

galaxy_map[0..-2].each_with_index do |galaxy, i|
    galaxy_map[i+1..-1].each_with_index do |next_galaxy, j|
        row_expansions = [*galaxy[0]..next_galaxy[0]] & rows_to_expand
        col_expansions = []
        if galaxy[1] <= next_galaxy[1]
            col_expansions = [*galaxy[1]..next_galaxy[1]] & columns_to_expand
        else
            col_expansions = [*next_galaxy[1]..galaxy[1]] & columns_to_expand
        end
        x_dist = (galaxy[1]-next_galaxy[1]).abs + ((EXPANSION_MULTIPLIER-1)*col_expansions.length)
        y_dist = (galaxy[0]-next_galaxy[0]).abs + ((EXPANSION_MULTIPLIER-1)*row_expansions.length)
        dist = x_dist + y_dist
        total_dist += dist
    end
end

p total_dist