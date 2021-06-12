puts "Welcome to guess the number"
print "What's your name? "
name = gets.chomp
puts "welcome #{name}"

puts "compiling random number generator..."

target = rand(100) + 1
guesses = 10

puts "You have #{guesses} tries to guess the correct number"

while guesses > 0
  
  guess = gets.chomp
  guesses -=1

  if guess == target 

    puts "#{guess} is correct!"
    break 

  elsif guesses >= 1
    puts "#{guess} is incorrect\nyou have #{guesses} guesses left\nguess again."
  else 
    puts "You're out of guesses. GOODBYE!"
    puts "correct number is #{target}"

  end
end
