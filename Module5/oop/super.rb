module AccessMoves
  def getMoves(moves)
    movesArray = moves.map { | move, value | move }
    movesArray.shuffle
  end
end

class Fighter
  include AccessMoves

  attr_reader :name, :moves
  def initialize(name)
    if name.to_i > 0       
      raise "#{name} isn't a valid name"
    elsif name.empty? || name == " "
      raise "name can't be empty"
    else
      @name = name
    end
  end
end

