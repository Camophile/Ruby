input = 0
until input == "0" or input.to_i > 0
  input = gets.chomp
  puts "input: #{input}"
end

amount = input.to_f.round(2)
puts amount

