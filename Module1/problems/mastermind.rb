hint = String.new
puts "MASTERMIND"

guessCount = 0

until hint == "XXXX"
        hint = ""
	# code = Array.new(4) { rand(1..6) } 
	code = [1, 2 ,3 , 4]
	puts "code: #{code}"
        print "[#{guessCount + 1}] Enter your guess: "
        entry = gets.chomp
        puts "entry: #{entry}, size: #{entry.size}"
	# guess = [3, 6, 5, 2]
  if entry.size == 4 && entry.to_i > 0
	guess = entry.split("").map(&:to_i)
	puts "guess: #{guess}"

        code.each_with_index do | value, i |
          if value == guess[i]
            hint.prepend("X")
          elsif code.include? guess[i]
            hint.concat("x")
          end
          puts "current value: #{value}, current guess: #{guess[i]}, hint: #{hint}"
        end # each
    guessCount += 1
  end # if
puts "guessCount: #{guessCount}"
puts ""
end # until
puts "Nice work! You took #{guessCount} guess#{guessCount == 1 ? "" : "es"}"
