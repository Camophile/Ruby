puts "Welcome to guess the number"
print "What's your name? "
name = gets.chomp
puts "welcome #{name}"

puts "compiling random number generator..."
target = rand(100)
puts target
