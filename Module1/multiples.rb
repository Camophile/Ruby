def customized_list_of_multiples(multiples_of, size)
  list = []
  size.times { | time | list << (time + 1) * multiples_of  }
  
  if block_given?
    yield(list)
  else
    list
  end
end

print "enter a number to create multiples of "
multiplier = gets.chomp.to_i
print "how many multiples of #{multiplier} do you want? "
size = gets.chomp.to_i
puts customized_list_of_multiples(multiplier, size)
