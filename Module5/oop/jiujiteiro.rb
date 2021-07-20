require_relative "super"

class Jiujiteiro < Fighter
  attr_reader
  ATTACKS = {
    "takedown" => 2,
    "throw_down" => 6,
    "triangle_choke" => 8,
    "armbar" => 4,
    "rear_choke" => 12,
    "kneebar" => 10
  }
  
  def initialize(name)
    super(name)
    @type = "jiujiteiro"
    @attacks = getMoves(ATTACKS)
  end

  def getAttacks
    ATTACKS
  end
end

