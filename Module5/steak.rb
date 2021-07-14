class Steak
  include Comparable
  attr_accessor :grade
    GRADES = {
      "Prime" => 3,
      "Choice" => 2,
      "Select" => 1
    }

  def <=>(steak)
    currentSteak = GRADES[grade]
    compareSteak = GRADES[steak.grade]
    #if currentSteak > compareSteak # compare the current steak object's grade IV to the grade IV of the entered steak object 
     # return 1
    #elsif currentSteak < compareSteak
     # return -1
    #else
     # return 0
    #end
    currentSteak <=> compareSteak
  end
end

first_steak = Steak.new
first_steak.grade = "Prime"
second_steak = Steak.new
second_steak.grade = "Choice"

puts first_steak <=> second_steak 
puts second_steak <=> first_steak 
puts "I'll take #{first_steak > second_steak ? "First steak" : "Second steak"}"
