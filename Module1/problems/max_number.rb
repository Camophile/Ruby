puts "enter two numbers"

while true
  numbersArray = []
  numbers = gets.chomp

  numbers.split(" ").each do |n|
    num = Float(n) rescue false
    numbersArray.push(num)
  end

  if numbersArray.length == 2 # only calls when there are 2 entries
    first = numbersArray[0]
    second = numbersArray[1]
      
    if first != false && second != false
      if first == second
        puts "#{first.to_i} and #{second.to_i} are the same number. Try again!"
      else
        max = first > second ? first : second  
        puts "Max: #{max.to_i}"
        break
      end
    else
      puts "please enter a valid number"
    end
  else 
    puts "please enter exactly two numbers"
  end
end

