module AccessMoves
  def getMoves(moves)
    moves.map { | move, value | move }
  end
end

class Fighter
  include AccessMoves
  MOVES = {
    "jab" => 2,
    "cross" => 6,
    "hook" => 8,
    "uppercut" => 4,
    "haymaker" => 12,
    "right_hand_lead" => 10 
  }

  attr_reader :name, :punches
  def initialize(name)
    if name.to_i > 0       
      raise "#{name} isn't a valid name"
    elsif name.empty? || name == " "
      raise "name can't be empty"
    else
      @name = name
    end
    @punches = getMoves(MOVES).shuffle
  end
end

