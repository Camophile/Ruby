linesArray = []
File.open("reviews.txt") { | review_file | linesArray = review_file.readlines  }

linesArray = linesArray.find_all { | line | line.include?("Truncated") }

#linesArray.each_with_index do | line, i |
 # unless line.include?("Truncated")
  #  linesArray.delete_at(i)
  #end
#end

linesArray.each { |n| puts n}
