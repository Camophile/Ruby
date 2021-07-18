require_relative "jiujiteiro"
require_relative "boxer"
require_relative "kickboxer"

#silva = Jiujiteiro.new("Anderson")
#p silva.attacks

#ali = Boxer.new("Mohammad")
#p ali.attacks
#puts "#{ali.name}'s attacks: #{ali.getAttacks}"
#ali.attacks.size.times{ |i| p ali.attacks[i], silva.attacks[i]}

#p ali.is_a? Fighter

def getFighterType
  fighterType = 0
  print "Type 1 for Boxer. Type 2 for Kickboxer. Type 3 for Jiujiteiro: "
  fighterType = gets.chomp.to_i
p "fighterType: #{fighterType}"
  unless (1..3) === fighterType # check if entry is between 1-3
    puts "Invalid entry."
    getFighterType
  else
    fighterType - 1
  end
end

def getFighterName
  name = gets.chomp
  if name.to_i > 0
    puts "#{name} isn't a valid name"
    getFighterName
  elsif name.empty? || name == " "
    puts "name can't be empty"
    getFighterName
  else
    name
  end
end

def getFighter
  
end


def fight
  firstFighter = Object.new
  secondFighter = Object.new

  2.times do | i |
    p "Pick a name for fighter ##{i+1}"

    name = getFighterName
    puts "Choose #{name}'s fighting style"
    type = ["boxer", "kickboxer", "jiujiteiro"][getFighterType]

    case type
    when "boxer"
      firstFighter.is_a?(Fighter) ? secondFighter = Boxer.new(name) : firstFighter = Boxer.new(name)
    when "kickboxer"
      firstFighter.is_a?(Fighter) ? secondFighter = Kickboxer.new(name) : firstFighter = Kickboxer.new(name)
    when "jiujiteiro"
      firstFighter.is_a?(Fighter) ? secondFighter = Jiujiteiro.new(name) : firstFighter = Jiujiteiro.new(name)
    end
  end

puts "#{firstFighter.name} is #{firstFighter.type} with the following moves: #{firstFighter.attacks}"
puts "#{secondFighter.name} is #{secondFighter.type} with the following moves: #{secondFighter.attacks}"


end

fight
