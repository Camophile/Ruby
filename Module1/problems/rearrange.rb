def sortIndex(array)
  switch = false # sets switch to false at each new iteration to check for any movement
  length = array.length
  length.times do | i |
    backwardsIndex = length - i # start at the end of the array and work backwards
    unless backwardsIndex == length # ignore when backwardsIndex is == length so we don't attempt to look outside of possible elements
      if array[backwardsIndex] > array[backwardsIndex - 1] # check if current element is greater than leftmost element
        array[backwardsIndex], array[backwardsIndex - 1] = array[backwardsIndex - 1], array[backwardsIndex] # if so switch
        switch = true
          if switch # if switch is true, there has been movement, so we need to recheck the previous indexes, so call sortIndex again until always returns false, ie no movement
            sortIndex(array)
          end # if
      end #if
    end # unless
  end # times
  array # return the final sorted array
end

while true
  print "Enter a number: "
  entry = gets.chomp
  number = Integer(entry) rescue false # if not an integer, returns false so will loop back to beginning
  if number
    numberArray = entry.split("")
    puts "#{sortIndex(numberArray).join}"
    break
  end # if
end # while 
