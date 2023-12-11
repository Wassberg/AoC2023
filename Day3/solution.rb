lines = File.readlines('Day3\testInput.txt', chomp: true)
# lines = File.readlines('Day3\input.txt', chomp: true)

grid = []
num_locations = []

lines.each_with_index do |l, row|
    nums = []
    l.split("").each_with_index do |c, col|
        if c.match(/[0-9]/)
            nums.append(col)
            next
        end
        if not nums.empty?
            num_locations.append(nums)
        end
        nums = []
    end
end

p num_locations