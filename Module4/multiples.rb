def customized_list_of_multiples(multiples_of, size)
  list = []
  size.times { | time | list << (time + 1) * multiples_of  }
  if block_given?
    puts "#{yield(list)}\n"
  else
    puts "#{list}\n"
  end
end

print "enter a number to create multiples of "
multiplier = gets.chomp.to_i
print "how many multiples of #{multiplier} do you want? "
size = gets.chomp.to_i

customized_list_of_multiples(multiplier, size) # returns array of multiples of multiplier to the length of size

customized_list_of_multiples(multiplier, size) do | list | # for each multiple of multiplier, returns array of even ones
  list.find_all { | num | num.even? }
end

customized_list_of_multiples(multiplier, size) do | list | # for each multiple of multiplier, returns array of multiple raised to the power of multiplier
  list.map { | num | num ** multiplier }
end
