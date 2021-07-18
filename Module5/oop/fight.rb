require_relative "jiujiteiro"
require_relative "boxer"
require_relative "kickboxer"

def getFighterType
  print "Type 1 for Boxer\nType 2 for Kickboxer\nType 3 for Jiujiteiro\nENTRY: "
  fighterType = gets.chomp.to_i
  unless (1..3) === fighterType # check if entry is between 1-3
    puts "\nInvalid entry."
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

def fight(fighter1, fighter2)
  fighter1Lives = 100
  fighter2Lives = 100

  fighter1AttacksHash = fighter1.getAttacks
  fighter2AttacksHash = fighter2.getAttacks

  fighter1ING = fighter1.type.delete_suffix("er") + "ing"
  fighter2ING = fighter2.type.delete_suffix("er") + "ing"

  puts fighter1AttacksHash
  puts fighter2AttacksHash
  movesCount = fighter1.attacks.size

  while fighter1Lives > 0 || fighter2Lives > 0
    movesCount.times do | i |
      # a new series of attacks each round  

      fighter1Attacks = fighter1.attacks.shuffle 
      fighter2Attacks = fighter2.attacks.shuffle  
      fighter1Attack = fighter1Attacks[i]
      fighter2Attack = fighter2Attacks[i]

      puts "#{fighter1.name} throws a #{fighter1Attack}"
      puts "#{fighter2.name} counters with a #{fighter2Attack}"
      puts ""
    
      puts "#{fighter1Attack} is worth #{fighter1AttacksHash[fighter1Attack]}"
      puts "#{fighter2Attack} is worth #{fighter2AttacksHash[fighter2Attack]}"
      puts ""

      fighter1Lives -= fighter2AttacksHash[fighter2Attack]
      fighter2Lives -= fighter1AttacksHash[fighter1Attack]

    
      puts "#{fighter1.name} is #{fighter1ING} at #{fighter1Lives}"
      puts "#{fighter2.name} is #{fighter2ING} at #{fighter2Lives}"
      puts ""
    end
  end
  
    puts "#{fighter1.name} lives: #{fighter1Lives}"
    puts "#{fighter2.name} lives: #{fighter2Lives}\n"

end
=begin
firstFighter = Object.new
secondFighter = Object.new

2.times do | i |
  print "Pick a name for fighter ##{i+1}: "

  name = getFighterName
  puts "\nChoose #{name}#{name[-1] == "s" ? "'" : "'s"} fighting style"
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

#puts "#{firstFighter.name} is #{firstFighter.type} with the following moves: #{firstFighter.attacks}"
#puts "#{secondFighter.name} is #{secondFighter.type} with the following moves: #{secondFighter.attacks}"
=end
firstFighter = Boxer.new("fighter1")
secondFighter = Kickboxer.new("fighter2")
fight(firstFighter, secondFighter)
