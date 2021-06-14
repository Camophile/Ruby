while true
  # print "Enter a number: "
  entry = "527938" # gets.chomp
  number = Integer(entry) rescue false

  if number
    numberArray = entry.split("")
    length = numberArray.length
    puts "numberArray: #{numberArray}"
    length.times do | i |
      backwardsIndex = length - i
      puts "backwardsIndex: #{backwardsIndex}"
      unless backwardsIndex == length
        puts "backwardsIndex: #{backwardsIndex}, numberArray[backwardsIndex]: #{numberArray[backwardsIndex]}"
   
        if numberArray[backwardsIndex] > numberArray[backwardsIndex - 1]

          numberArray[backwardsIndex], numberArray[backwardsIndex - 1] = numberArray[backwardsIndex - 1], numberArray[backwardsIndex]
          puts "numberArray after sort: #{numberArray}"
        end #if
      end # unless

    end # each 
    puts "final: #{numberArray}"
    break
  end # if
end # while 
