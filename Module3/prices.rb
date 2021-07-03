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

# The first version (unrefactored) seems the simpler strategy since we're not mentally keeping track of which blocks of code to use and variables to put in play when and the logic is abstracted into each individual method definition. It's better to abstract the loops per method in this case rather than try to track which operation we should input into the reducer

# Repitition for clarity if it doesn't weigh down or compromise performance and provides human legibility
