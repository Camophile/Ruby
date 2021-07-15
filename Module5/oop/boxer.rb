require_relative "super"

class Boxer < Fighter
  MOVES = {
    "jab" => 2,
    "cross" => 6,
    "hook" => 8,
    "uppercut" => 4,
    "haymaker" => 12,
    "right_hand_lead" => 10 
  }
end

ali = Fighter.new("Mohammad")
p ali.punches

foreman = Fighter.new("George")
p foreman.punches
