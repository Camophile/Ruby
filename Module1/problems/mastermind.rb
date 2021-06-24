hint = String.new
puts "MASTERMIND"

guessCount = 0

until hint == "XXXX"
        unless hint == "" 
          puts hint
        end 
        hint = ""
	# code = Array.new(4) { rand(1..6) } 
	code = [1, 2 ,3 , 4]
        print "[#{guessCount + 1}] Enter your guess: "
        entry = gets.chomp
  if entry.size == 4 && entry.to_i > 0
	guess = entry.split("").map(&:to_i)

        code.each_with_index do | value, i |
          if value == guess[i]
            hint.prepend("X")
          elsif code.include? guess[i]
            hint.concat("x")
          end
        end # each
    guessCount += 1
  end # if
end # until
puts "Nice work! You took #{guessCount} guess#{guessCount == 1 ? "" : "es"}"
