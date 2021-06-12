puts "Welcome to guess the number"
#print "What's your name? "
# name = gets.chomp
#puts "welcome #{name}"

puts "compiling random number generator..."

target = rand(100) + 1
target = 10
guesses = 10

puts "You have #{guesses} tries to guess the correct number"

while guesses > 0
  
  guess = gets.chomp.to_i
  guesses -=1

  s = guesses > 1 ? "es" : ""
  
  if guess == target 
    if guesses <= 1
      puts "inside if: ${guesses}"
      s = "es"
    elsif guesses == 9
      s = ""
    end

    puts "outside if: #{guesses}"
    puts "#{guess} is correct!\nyou guessed it in #{10 - guesses} guess#{s}"
    break 

  elsif guesses >= 1
      if guess > target
        puts "#{guess} is too high"
      else
        puts "#{guess} is too low"
      end
    puts "#{guesses} guess#{s} left\nguess again."
  else 
    puts "You're out of guesses. GOODBYE!"
    puts "correct number is #{target}"

  end
end
