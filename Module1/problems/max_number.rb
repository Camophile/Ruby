puts "enter two numbers"

numbersArray = []

numbers = gets.chomp

numbers.split(" ").each do |n|
  numbersArray.push(n)
end

if numbersArray.length > 2
  puts "please only enter two numbers"
else
  puts "you have #{numbersArray.length} numbers"
end


