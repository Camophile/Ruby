code = Array.new(4) { rand(1..6) } 
hint = []
guessCount = 1

puts "MASTERMIND"

until hint.join("") == "XXXX"

        unless hint == [] # doesn't show hint if none of the digits match 
          puts hint.join("") 
        end

        trackHash = {} # initiate track hash to see previous matches in the round
        hint = [] # reset the hint on each new attempt

	# code = [1, 2 ,3 , 4]
        print "[#{guessCount}] Enter your guess: "
        entry = gets.chomp

  if entry.size == 4 && entry.to_i > 0 # check if the string entered is 4 long and numerical/not negative
    guess = entry.split("").map(&:to_i)
    unless guess.any? { | v | v >= 7 } # checks each element and if any >= 7 skips

      guess.each_with_index do | guessValue, i |
        code.each_with_index do | codeValue, y |
puts "guess index: #{i}, guessValue: #{guessValue}, code index: #{y}, codeValue: #{codeValue}"
          if guessValue == codeValue
puts "inside values maching"
            matchValue = guess[i]
puts "#{matchValue}"
            if i == y
puts "inside indexes matching"
puts "trackHash: #{trackHash}, y: #{y}"
              if trackHash[y] == matchValue # we look in the track hash to see if this index was caught when indexes didn't match
puts "inside if trackHash == y: trackHash[#{y}]: #{trackHash[y]}"
                hint.pop if hint[-1] == "x"
                # trackHash.delete(y)
              end # if
              hint.unshift("X") # place "X" at beginning when indexes match
              trackHash[y] = matchValue
puts "add X to beginning of hint: #{hint}, add value to trackHash: #{trackHash}"
            else # values match but not indexes
              unless trackHash[y] == matchValue # we look in the track hash to see if this index was caught when indexes didn't match
                hint << "x" 
                trackHash[y] = matchValue
puts "values match but not indexes: hint: #{hint}, trackHash: #{trackHash}"
              end
            end # if indexes match

          end # if values match
puts ""
        end # code each
      end # guess each
    guessCount = hint.join("") == "XXXX" ? guessCount : guessCount + 1 # either a correct guess or an entry has a digit > 7, either way count is paused
    else # (for unless) detected a digit > 6 so guess not counted
      hint = []
    end # unless
  end # if
end # until
puts "Nice work! You took #{guessCount} guess#{guessCount == 1 ? "" : "es"}"
