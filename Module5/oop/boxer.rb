require_relative "super"

class Boxer < Fighter
  attr_accessor :punches
  PUNCHES = {
    "jab" => 2,
    "cross" => 6,
    "hook" => 8,
    "uppercut" => 4,
    "haymaker" => 12,
    "right_hand_lead" => 10 
  }

  def punches
    @punches = getMoves(PUNCHES)
  end
end

ali = Boxer.new("Mohammad")
p ali.punches
foreman = Boxer.new("George")
p foreman.punches
