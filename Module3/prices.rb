prices = [3.99, 25.0, 8.99]

def total(array)
  format("%.2f", array.reduce(:+))
end

def refund(array)
  format("%.2f", array.reduce(:-))
end

def discount(array)
  discountedPrices = array.map { |i| i / 3.0}
end

puts total(prices)
puts refund(prices)
discount(prices).each { | price | puts format("Your discount: $%.2f", price) }
