def hintAggregator (guess, code = Array.new(4) { rand(1..6) })
  trackHash = {} # initiate track hash to see previous matches in the round
  hint = []
      
    guess.each_with_index do | guessValue, i |
      catch :captured_index do # we break out of loop so if a code index is captured we don't keep looking at the guesses (prevents duplicate hints when there is more than the same digit in the code)
      code.each_with_index do | codeValue, y | # 
puts "i: #{i}, y: #{y}, guessValue: #{guessValue}, codeValue: #{codeValue}, trackHash: #{trackHash}, hint: #{hint}"
        if guessValue == codeValue
          matchValue = guess[i]
          if i == y
puts "indexes match - trackHash[#{y}]: #{trackHash[y]}, matchValue: #{matchValue}, hint: #{hint}"
            if trackHash[y] == matchValue # we look in the trackHash to see if this index was already caught
              hint.pop if hint[-1] == "x" # if so we remove the previous non-index-matched hint and add the index one below
puts "inside trackHash[#{y}] exists: hint: #{hint}"
            end # if
            hint.unshift("X") # place "X" at beginning when indexes match
            trackHash[y] = matchValue
              throw :captured_index # jump to the next index in the guess array
puts "indexes values match after displace - trackHash[#{y}]: #{trackHash[y]}, matchValue: #{matchValue}, hint: #{hint}"
          else # values match but not indexes
puts "indexes values match but not indexes - trackHash[#{y}]: #{trackHash[y]}, matchValue: #{matchValue}"
            unless trackHash[y] == matchValue # we look in the track hash to see if this index was caught when indexes didn't match
              hint << "x" # if not already matched we add an "x"
              trackHash[y] = matchValue
puts "inside unless: trackHash[#{y}] does not equal match value - trackHash[#{y}]: #{trackHash[y]}, matchValue: #{matchValue}"
             throw :captured_index # jumpt to the next indext in the guess array
            end # unless
          end # if indexes match
        end # if values match
puts ""
      end # code each
    end # guess each
  end # end catch
  hint
end

hint = []

puts "MASTERMIND"

until hint.join("") == "XXXX"
  guessCount = 1

        unless hint == [] # doesn't show hint if none of the digits match 
          puts hint.join("") 
        end

        hint = [] # reset the hint on each new attempt

	#code = [1, 2, 3, 4]
        code = [6, 4, 4, 6]

        print "[#{guessCount}] Enter your guess: "
        entry = gets.chomp

  if entry.size == 4 && entry.to_i > 0 # check if the string entered is 4 long and numerical/not negative
    guess = entry.split("").map(&:to_i)
    unless guess.any? { | v | v >= 7 } # checks each element and if any >= 7 skips

      hint = hintAggregator(guess, code) # code param passed for test otherwise instantiate above
      
    guessCount = hint.join("") == "XXXX" ? guessCount : guessCount + 1 # either a correct guess or an entry has a digit > 7, either way count is paused
    else # detected a digit > 6 so guess not counted
      hint = []
    end # unless
  end # if
end # until
puts "Nice work! You took #{guessCount} guess#{guessCount == 1 ? "" : "es"}"
