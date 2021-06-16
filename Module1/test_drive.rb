def accelerate
  puts "step on the gas"
  puts "speeding up"
end

def sound_horn
  puts "pressing the horn"
  puts "honk honk"
end

def use_headlights(brightness="blinding")
  puts "turning headlights to #{brightness}"
  puts "run 'em over"
end

def mileage(miles, fuel)
  return 0.0 if fuel == 0
  miles/fuel
end

sound_horn
accelerate
use_headlights
puts "you got #{mileage(400, 12)} MPG on this trip"
puts "new cars have #{mileage(0, 0)} MPG"
puts "This car averages #{mileage(11432, 366)} MPG"


