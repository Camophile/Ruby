require_relative "super"

class Kickboxer < Fighter
  attr_reader :attacks
  ATTACKS = {
    "front_kick" => 2,
    "tiger_claw" => 6,
    "jump_spin_kick" => 8,
    "side_kick" => 4,
    "eagle_strike" => 12,
    "roundhouse" => 10 
  }
  
  def initialize(name)
    super(name)
    @type = "kickboxer"
    @attacks = getMoves(ATTACKS)
  end

  def getAttacks
    ATTACKS
  end
end

