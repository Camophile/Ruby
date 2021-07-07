input = 0
outputString = "You need to dispense"

def calcChange(amount)
puts "amount before inside calcChange: #{amount}"
coinsHash = {}
coins = {
  "toonie": 200,
  "loonie": 100,
  "quarter": 25,
  "dime": 10,
  "nickel": 5
}
  coins.each do | coin, value |
    until amount < value
      amount = amount - value
      coinsHash[coin] = coinsHash[coin] ? coinsHash[coin] += 1 : 1
puts "amount after reduce: #{amount}"
    end # until
  end # each
  coinsHash = yield(coinsHash, amount) # we check if amount should be rounded to 5, and if it should, we add a nickel 
puts "coinsHash final: #{coinsHash}"
  coinsHash
end

until input == "0" or input.to_f > 0
  print "How much change is owed? "
  input = gets.chomp
end

amount = (input.to_f.round(2)*100)

puts "amount before calcChange: #{amount}"

changeHash = calcChange(amount) do | hash, change |
  nickelCount = hash[:nickel]
  unless change < 3 # check "change" value and add a nick if there are 3 cents or more remaining
    hash[:nickel] = nickelCount ? nickelCount + 1 : 1 # add a nickel if no nickels already counted, otherwise add 1 more nickels
  end
  hash
end

puts "coinHash after: #{changeHash}"
outputArray = changeHash.map { | coin, number | " #{number} #{coin}#{number == 1 ? "" : "s"}" if number > 0 }
puts "outputArray: #{outputArray}"

outputArray.each do | coin |
  unless coin == outputArray.last
    outputString.concat("#{coin},")
  else
    outputString.concat(" and#{coin}.") if coin
  end
end
puts "outputString: #{outputString}"
