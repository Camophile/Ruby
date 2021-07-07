linesArray = []
File.open("reviews.txt") { | review_file | linesArray = review_file.readlines  }

linesArray = linesArray.find_all { | line | line if line.include?("Truncated") }
linesArray = linesArray.reject { |l| l.include?("--") }

adjectives = []
linesArray.each do |l|
  wordsArray = l.split(" ")
  wordsArray.each_with_index { |w, i| adjectives << wordsArray[i+1] if w == "is" }
end

puts adjectives
