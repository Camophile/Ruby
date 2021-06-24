year = 0

until year.is_a?(Integer) && year > 0
  puts "Enter a year: "
  entry = gets.chomp
  year = Integer(entry) rescue false # if not an integer, returns false so will loop back to beginning
  unless year.is_a?(Integer) && year > 0
    puts "#{year} is not a valid year"
  end
end

if year % 4 == 0
  puts "#{year} is a leap year"
elsif year % 100 == 0 && year % 400 == 0
  puts "#{year} is a leap year"
else
  puts "#{year} is not a leap year"
end

