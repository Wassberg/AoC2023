# lines = File.readlines 'Day1\testInput2.txt'
lines = File.readlines 'Day1\input.txt'

sum = 0
exp = /(?=([0-9]|one|two|three|four|five|six|seven|eight|nine))/

for l in lines 
    numbers = []
    for strNum in l.scan(exp).flatten
        if(strNum == "one")
            numbers.append(1)
        elsif(strNum == "two")
            numbers.append(2)
        elsif(strNum == "three")
            numbers.append(3)
        elsif(strNum == "four")
            numbers.append(4)
        elsif(strNum == "five")
            numbers.append(5)
        elsif(strNum == "six")
            numbers.append(6)
        elsif(strNum == "seven")
            numbers.append(7)
        elsif(strNum == "eight")
            numbers.append(8)
        elsif(strNum == "nine")
            numbers.append(9)
        elsif not strNum.empty?
            numbers.append(strNum.to_i)
        end
    end
    sum += numbers[0]*10 + numbers[-1]
end

puts sum