hint = String.new
puts "MASTERMIND"
guessCount = 1

until hint == "XXXX"

        unless hint == "" # doesn't show hint if none of the digits match 
          puts hint 
        end

        hint = "" # reset the hint on each new attempt
	# code = Array.new(4) { rand(1..6) } 
	code = [1, 2 ,3 , 4]
        print "[#{guessCount}] Enter your guess: "
        entry = gets.chomp
  if entry.size == 4 && entry.to_i > 0 # check if the string entered is 4 long and numerical/not negative
    guess = entry.split("").map(&:to_i)
    puts "code: #{code}, guess: #{guess}"
    puts ""
    unless guess.any? { | v | v >= 7 } # checks each element and if any >= 7 skips
      code.each_with_index do | codeValue, c |
        guess.each_with_index do | guessValue, g |
          if codeValue == guessValue
            if c == g
              hint.prepend("X")
              break
            elsif g > c # guess.any? { | v | code.include? v  } # code.include? guess[i]
              puts "code index: #{c}, code value: #{codeValue}, guess index: #{g}, guess value: #{guessValue}"
              hint.concat("x")
              break
          # puts "inside else - code value: #{value}, guess value: #{v}"
            end # if
# hint.concat("x") # need to refactor this as it provides 'x'' for each guess of a value and doesn't take into consideration how many times a value occurs in the "code"
          else
            
          end # if
        end # each
      end # each
    guessCount = hint == "XXXX" ? guessCount : guessCount + 1 # either a correct guess or an entry has a digit > 7, either way count is paused
    else # detected a digit > 6 so guess not counted
      hint = ""
    end # unless
  end # if
end # until
puts "Nice work! You took #{guessCount} guess#{guessCount == 1 ? "" : "es"}"
