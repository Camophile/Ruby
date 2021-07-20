### This program simulates a MMU combat between two combatants
### The user is asked to define two fighters from a selection 
### of 3 subclasses of Figheter, pick their name and choose the type:
### Boxer, Kickboxer and Jiujiteiro. 

### The fighters are then they are each given a randomized set of attacks per their class definition. 
### The fight is initiated when two objects of the subclasses of Fight are defined.
## Each fighter is initialized with 100 life points. Life is decremented 
### based on the "attack" of their opponent. The first one to reach 0 or less loses and the winner is made champion. 
### The program can tell who the last champion was as well as track ties. A tie breaker can be initialized and 
### the winner of the tie is named champion.
###
### Give it a try: ruby fight.rb

require_relative "jiujiteiro"
require_relative "boxer"
require_relative "kickboxer"

# returns an integer between 1-3 so we know which fighter class to build

def getFighterType
  print "Type 1 for Boxer\nType 2 for Kickboxer\nType 3 for Jiujiteiro\nENTRY: "
  userSelection = gets.chomp.to_i
  unless (1..3) === userSelection # check if entry is between 1-3
    puts "\nInvalid entry."
    getFighterType
  else
    userSelection - 1 # needs to be 0 indexed to pick from fighter type array
  end
end

# makes sure the name is a word string

def getFighterName
  name = gets.chomp
  blank_reg = /\A[[:space:]]*\z/
  if name.to_i > 0
    puts "#{name} isn't a valid name"
    getFighterName
  elsif name.empty? || name.match?(blank_reg)
    puts "name can't be empty"
    getFighterName
  else
    name
  end
end

# if there is a champion before the round begins (only the case in a rematch) we define them as champion, otherwise return nil

def getChampion(fighter1, fighter2)
  champion = nil
  if fighter1.is_champion || fighter2.is_champion
    champion = fighter1.is_champion ? fighter1 : fighter2
  end
  champion
end

def fight(fighter1, fighter2)
  rematch = false

  winner = Object.new
  loser = Object.new
  champion = getChampion(fighter1, fighter2) # returns nil if no pre-defined champion

  if champion
    puts "The reigning world champion is #{champion.name}."
    puts ""
  end

  # set the fighter lives to 100 and work down as fight progresses. First one to reach <= 0 loses

  fighter1Lives = 100
  fighter2Lives = 100

  fighter1AttacksHash = fighter1.getAttacks
  fighter2AttacksHash = fighter2.getAttacks

  # this is just window dressing

  fighter1ING = fighter1.type.delete_suffix("er") + "ing"
  fighter2ING = fighter2.type.delete_suffix("er") + "ing"

  # all fighters will have 6 moves so just assign the count to the loop range

  movesCount = fighter1.attacks.size

  while fighter1Lives > 0 && fighter2Lives > 0
    movesCount.times do | i |

      # shuffle their attacks so they get a different sequence of attacks points each round  

      fighter1Attacks = fighter1.attacks.shuffle 
      fighter2Attacks = fighter2.attacks.shuffle  

      # current move of each fighter per round      

      fighter1Attack = fighter1Attacks[i]
      fighter2Attack = fighter2Attacks[i]

      puts "#{fighter1.name} throws a #{fighter1Attack}"
      puts "#{fighter2.name} counters with a #{fighter2Attack}"
      puts ""
    
      puts "#{fighter1Attack} is worth #{fighter1AttacksHash[fighter1Attack]}"
      puts "#{fighter2Attack} is worth #{fighter2AttacksHash[fighter2Attack]}"
      puts ""

      # decrement fighters' lives per the damage points defined in their opponent's attacks hash

      fighter1Lives -= fighter2AttacksHash[fighter2Attack]
      fighter2Lives -= fighter1AttacksHash[fighter1Attack]

      puts "#{fighter1.name} is #{fighter1ING} at #{fighter1Lives}"
      puts "#{fighter2.name} is #{fighter2ING} at #{fighter2Lives}"
      puts ""

      # when we get one fighter at <=0 lives, break loop

      if fighter1Lives <= 0 || fighter2Lives <= 0
        unless fighter1Lives == fighter2Lives  # treat ties separately

          winner = fighter1Lives > fighter2Lives ? fighter1 : fighter2
          loser = fighter1Lives < fighter2Lives ? fighter1 : fighter2
          loser.is_champion = false # if the current loser had attr is_champion == true, set it to false, since they lost
          winner.is_champion = true

        else # (from unless) there's a tie, ask if want to play again?
          puts "There's been a tie!\nOvertime!!!"
          puts "Are you ready for a tie breaker? (y/n)"
          entry = gets.chomp.downcase
          if entry == "y" || entry == "yes"
            rematch = true 
          elsif champion
            winner = champion # tie and no winner, so set winner to last champion
          else
            winner = nil # no winner declared and no tiebreaker called for. Winner stays empty
          end
        end #unless
	break # break out of fight loop when one fighter hits <= 0 lives
      end # if
    
    end # times
  end # while

  unless rematch # when rematch selected (ie. == true), we don't need to reprint their lives
    puts "#{fighter1.name} lives are at: #{fighter1Lives}"
    puts "#{fighter2.name} lives are at: #{fighter2Lives}\n"

    if winner.is_a?(Fighter) # if a winner has been declared
      puts "#{winner.name} is#{winner == champion ? " still" : ""} champion of the world!\n"
    elsif winner == nil # there was a tie and no tie breaker called
      puts "No winner declared. The championship is still up for grabs!!"
      return
    end

    puts "rematch? (y/n) "
  
    entry = gets.chomp.downcase
    if entry == "y" || entry == "yes"
      rematch = true 
    end
  end

  unless rematch
    if winner.is_a?(Fighter)
      puts "#{winner.name} remains champion"
    else
      puts "No winner declared. The championship is still up for grabs!!"
    end
  end # unless

  if rematch
    fight(fighter1, fighter2)
  end
end
firstFighter = Object.new
secondFighter = Object.new

# program begins running here to define the fighter types and initiate the fight

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

fight(firstFighter, secondFighter)
