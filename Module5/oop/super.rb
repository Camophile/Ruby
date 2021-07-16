class Fighter
  # :type is the kind of fighter they are based on class type
  # :world_champion will be a boolean, and only one object can be world_champion at a time
  attr_reader :name, :type, :world_champion
  
  #FIGHTER_TYPE = ["boxer", "kick_boxer", "jiujiteiro"]
  def initialize(name)
    if name.to_i > 0       
      raise "#{name} isn't a valid name"
    elsif name.empty? || name == " "
      raise "name can't be empty"
    else
      @name = name
    end
  end
  def self.getMoves(moves)
    movesArray = moves.map { | move, value | move } # returns an array of moves appropriate to the class
    movesArray.shuffle
  end
end

