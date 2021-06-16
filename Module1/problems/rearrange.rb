def sortIndex(array)
  switch = false # sets switch to false at each new iteration to check for any movement
  length = array.length
  length.times do | i |
    index = length - 1 # start at the end of the array and work backwards
    operator = "-"
    if array[i] == "-" # means it's a negative, so start at beginning of array
      index = i
      operator = "+"
    end

    unless index == length # ignore when backwardsIndex is == length so we don't attempt to look outside of possible elements, ie. when i==0
#      operator = array[0] == "-" ? "+" : "-"
puts "operator: #{operator}"
      getElement = index.public_send(operator, 1)
puts "getElement: #{getElement}"
      if array[index] > array[getElement] # check if current element is greater than leftmost element
        array[index], array[getElement] = array[getElement], array[index] # if so switch
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
  # print "Enter a number: "
  entry = "-12532" # gets.chomp
  number = Integer(entry) rescue false # if not an integer, returns false so will loop back to beginning
  if number
#    puts "in number IF: #{number}"
    numberArray = entry.split("")
    puts "#{sortIndex(numberArray).join}"
    break
  end # if
end # while 
