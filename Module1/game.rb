puts "Welcome to guess the number"
print "What's your name? "
name = gets.chomp
puts "welcome #{name}"

puts "compiling random number generator..."

target = rand(100) + 1 # gives the random number we want user to guess
guesses = 10 # counts down from number of guesses

puts "You have #{guesses} tries to guess the correct number"

while guesses > 0 # repeat loop until they have 0 tries
  
  guess = gets.chomp.to_i
  guesses -=1 # increments guesses count down after the new round is initiated

  s = guesses > 1 ? "es" : "" # for the plural statement if they fail
  
  if guess == target 
    if guesses <= 1 # reverses plural statement since we're counting down (could be improved)
      s = "es"
    elsif guesses == 9
      s = ""
    end

    puts "#{guess} is correct!\nyou guessed it in #{10 - guesses} guess#{s}"

    break # break out of loop 

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
