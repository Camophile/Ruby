#code = Array.new(4) { rand(1..6) } 
hint = []
guessCount = 1

puts "MASTERMIND"

until hint.join("") == "XXXX"

        unless hint == [] # doesn't show hint if none of the digits match 
          puts hint.join("") 
        end

        trackHash = {} # initiate track hash to see previous matches in the round
        hint = [] # reset the hint on each new attempt

	code = [6, 4, 4 , 6]
        print "[#{guessCount}] Enter your guess: "
        entry = gets.chomp

  if entry.size == 4 && entry.to_i > 0 # check if the string entered is 4 long and numerical/not negative
    guess = entry.split("").map(&:to_i)
    unless guess.any? { | v | v >= 7 } # checks each element and if any >= 7 skips

      guess.each_with_index do | guessValue, i |
        code.each_with_index do | codeValue, y |
          if guessValue == codeValue
            matchValue = guess[i]
            if i == y
puts "indexes match"
              if trackHash[y] == matchValue # we look in the trackHash to see if this index was already caught
                hint.pop if hint[-1] == "x" # if so we remove the previous non-index-matched hint and add the index one below

              end # if
              hint.unshift("X") # place "X" at beginning when indexes match
              trackHash[y] = matchValue
            else # values match but not indexes
              unless trackHash[y] == matchValue # we look in the track hash to see if this index was caught when indexes didn't match
                hint << "x" # if not already matched we add an "x"
              trackHash[y] = matchValue
              end # unless
            end # if indexes match

          end # if values match
        end # code each
      end # guess each
    guessCount = hint.join("") == "XXXX" ? guessCount : guessCount + 1 # either a correct guess or an entry has a digit > 7, either way count is paused
    else # (for unless) detected a digit > 6 so guess not counted
      hint = []
    end # unless
  end # if
end # until
puts "Nice work! You took #{guessCount} guess#{guessCount == 1 ? "" : "es"}"
