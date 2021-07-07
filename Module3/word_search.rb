linesArray = []
File.open("reviews.txt") { | review_file | linesArray = review_file.readlines  }

linesArray = linesArray.find_all { | line | line if line.include?("Truncated") }
linesArray = linesArray.reject { |l| l.include?("--") }

def find_adjective(string)
  wordsArray = string.split(" ")
  i = wordsArray.find_index("is")
  wordsArray[i+1]
end

adjectives = linesArray.map { |l| "'#{find_adjective(l).capitalize}'" }

puts adjectives
