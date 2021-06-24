# code = Array.new(4) { rand(1..6) } 
code = [2, 6 ,3 , 4]
puts "code: #{code}"
# guess = gets.chomp.split("").to_i;
guess = [3, 6, 5, 2]
puts "guess: #{guess}"

hint = String.new

code.each_with_index do | value, i |
  if value == guess[i]
    hint.prepend("X")
  elsif code.include? guess[i]
    hint.concat("x")
  end
  puts "current value: #{value}, current guess: #{guess[i]}, hint: #{hint}"
end 


