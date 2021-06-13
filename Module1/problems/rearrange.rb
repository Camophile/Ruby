while true
  print "Enter a number: "
  entry = gets.chomp
  number = Integer(entry) rescue false
  if number
    sortedArray = [] # final array to be printed

    currentNum = 0 #current number being compared in the loop
    lastNum = 0 # last assessed num, which is given num at the end of loop

    numberArray = entry.split("")
    numberArray.each_with_index do | num, i |
      #if i >= i # if we're after the first loop
       # if sortedArray[i] > sortedArray[i-1]
        #end  
      #else # first iteration always puts number at beginning
        #sortedArray[i] = num
        #sortedArray.unshift(num)
      #end # if inside loop 
      puts "num: #{num}, i: #{i}"

    end # each 
    break
  end # if
end # while 
