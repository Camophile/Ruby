require_relative "super"

class Boxer < Fighter
  attr_reader :punches
  PUNCHES = {
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
    @punches = getMoves(PUNCHES)
  end
end

ali = Boxer.new("Mohammad")
p ali.punches
#p ali.methods
puts "#{ali.name} is a #{ali.type}"
puts "#{ali.name} is able to throw a #{ali.punches.join(" ")}"
puts "#{ali.name} is#{ali.world_champion ? "" : " not"} world champion"
foreman = Boxer.new("George")
puts "#{foreman.name} is able to throw a #{foreman.punches.join(" ")}"
#p foreman.punches
