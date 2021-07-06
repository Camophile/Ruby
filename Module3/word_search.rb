linesArray = []
File.open("reviews.txt") { | review_file | linesArray = review_file.readlines  }

puts "Line 4: #{linesArray[3]}"
puts "Line 1: #{linesArray[0]}"

