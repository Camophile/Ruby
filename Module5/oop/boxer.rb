require_relative "super"

class Boxer < Fighter
  ATTACKS = {
    "jab" => 2,
    "cross" => 6,
    "hook" => 8,
    "uppercut" => 4,
    "haymaker" => 12,
    "right_hand_lead" => 10 
  }
  
  def initialize(name)
    super(name)
    @type = "boxer"
    @attacks = getMoves(ATTACKS)
  end  

  def getAttacks
    ATTACKS
  end
end
