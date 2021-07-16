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
end
ali = Boxer.new("Mohammad")
p ali.attacks
#p ali.methods
puts "#{ali.name} is a #{ali.type}"
puts "#{ali.name} is able to throw a #{ali.attacks.join(" ")}"
puts "#{ali.name} is#{ali.world_champion ? "" : " not"} world champion"
foreman = Boxer.new("George")
puts "#{foreman.name} is able to throw a #{foreman.attacks.join(" ")}"
#p foreman.attacks
