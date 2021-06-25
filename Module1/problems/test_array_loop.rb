a1  = [9, 8, 7, 6]
b2  = [1, 2, 3, 4]

puts "#{a1}"
puts "#{b2}"
a1.each_with_index do | a1Value, a |
 b2.each_with_index do | b2Value, b |
    puts "a: #{a}, a1Value: #{a1Value}, b: #{b}, b2Value: #{b2Value}"
    puts ""
  end
end
