#lines = File.readlines('Day5\testInput.txt', chomp: true)
lines = File.readlines('Day5\input.txt', chomp: true)

seeds = []
to_check = []
match_map = []

for l in lines
    if l.match(/seeds: ?/)
        seeds = l.scan(/([0-9]+)/).flatten.map(&:to_i)
        match_map = seeds.dup
        next
    end

    if l.match(/map:/)
        to_check = to_check | match_map
        match_map = []
        next
    end

    if l.match(/[0-9]+ [0-9]+ [0-9]+/)
        dest, source, length = l.split(" ").flatten.map(&:to_i)
        dest_start = dest
        source_start = source
        source_end = source + (length-1)
        for s in to_check
            if s >= source_start and s <= source_end
                match_map.append(dest_start + (s - source_start))
                to_check = to_check - [s]
            end
        end
    end
end

p (match_map | to_check).min