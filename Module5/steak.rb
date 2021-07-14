class Steak
  attr_accessor :grade
    GRADES = {
      "Prime" => 3,
      "Choice" => 2,
      "Select" => 1
    }

  def >(steak)
    GRADES[grade] > GRADES[steak.grade] # compare the current steak object's grade IV to the grade IV of the entered steak object 
  end
end

first_steak = Steak.new
first_steak.grade = "Prime"
second_steak = Steak.new
second_steak.grade = "Choice"

puts "I'll take #{first_steak > second_steak ? "First steak" : "Second steak"}"
