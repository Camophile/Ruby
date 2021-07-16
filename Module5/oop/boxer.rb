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

  def punches
    @punches = getMoves(PUNCHES)
  end
  #def type=(value)
   # type = value.downcase
    #unless FIGHTER_TYPE.include? type
     # raise "#{value} is not an acceptable fighting style"
    #else
     # @type = type
    #end
  #end
end

ali = Boxer.new("Mohammad")
p ali.methods
p ali.punches
ali.type = "boxer"
puts "#{ali.name} is a #{ali.type}"
foreman = Boxer.new("George")
p foreman.punches
