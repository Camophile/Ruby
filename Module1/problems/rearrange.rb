while true
  print "Enter a number: "
  entry = gets.chomp
  num = Integer(entry) rescue false
  if num
    break
  end
end
