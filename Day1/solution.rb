lines = File.readlines 'Day1\testInput1.txt'
# lines = File.readlines 'Day1\input.txt'

sum = 0

for l in lines

    numbers = []
    for c in l.split("")
        if c.match(/[[:digit:]]/)
            numbers.append(c.to_i)
        end
    end
    sum += numbers[0]*10 + numbers[-1]
end

puts sum