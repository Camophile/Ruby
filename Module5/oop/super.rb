module FighterBuilder
  def getMoves(moves)
    movesArray = moves.map { | move, value | move }
    movesArray.shuffle
  end
end

class Fighter
  include FighterBuilder

  # :type is the kind of fighter they are based on class type
  # :world_champion will be a boolean, and only one object can be world_champion at a time

  attr_reader :name, :type, :is_champion
  
  FIGHTER_TYPE = ["boxer", "taekwondoin", "jiujiteiro"]

  def initialize(name="Anonymous")
    if name.to_i > 0       
      raise "#{name} isn't a valid name"
    elsif name.empty? || name == " "
      raise "name can't be empty"
    else
      @name = name
    end
      @is_champion = false
  end

  def championStatus
    puts "#{self.name} is#{self.is_champion ? "" : " not"} world champion"
  end

  def is_champion=(value)
    if !!value == value # check to see if the value is a boolean
      @is_champion = value
    else
      raise "is_champion must be either true or false"
    end
  end
end

