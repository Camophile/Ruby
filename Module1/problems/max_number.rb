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
      
    if first != false && second != false # if either entry is not a number will ask them to enter again
      if first == second # if they're the same number, asks them to try again
        puts "#{first} and #{second} are the same number. Try again!"
      else 
        max = first > second ? first : second # evaluates the larger of the two and assigns to `max`  
        puts "Max: #{max}"
        break # breaks out of the loop after evaluating larger number
      end
    else
      puts "please enter a valid number" # if either first or second aren't a number
    end
  else 
    puts "please enter exactly two numbers" # if there is more than 2 entries
  end
end

