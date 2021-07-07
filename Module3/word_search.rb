linesArray = []
File.open("reviews.txt") { | review_file | linesArray = review_file.readlines  }

linesArray = linesArray.find_all { | line | line if line.include?("Truncated") }
linesArray = linesArray.reject { |l| l.include?("--") }

linesArray.each { |n| puts n}
