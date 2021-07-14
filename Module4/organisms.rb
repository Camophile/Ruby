class Organism
  attr_accessor :name, :age, :shelf_life

  def initialize(name = "organism", age = 1)
    @name = name
    @age = age
    @shelf_life = rand(1..1000000)
  end

  def age=(value=1)
    if value.to_i < 1 # ensure value entered is an integer 
      raise "You can't have an organism that's #{value} years old"
    else
      @age = value
    end
  end

  def reveal_age
    puts "#{name} is #{age} year#{age > 1 ? "s" : ""} old"
  end

  def life_left
    life_left = shelf_life - age
    if life_left <= 0
      puts "#{name} is dead X("
    else
      puts "#{name} has #{life_left} years left to live"
    end
  end
end

class Scavanger < Organism

end

class Rummager < Organism
  
end

class Hunter < Organism

end

class Predator < Organism

end

class Shopper < Organism

end

rodney = Organism.new("Rodney")
rodney.age = 5
rodney.reveal_age
rodney.life_left

jimmy = Rummager.new("Jimmy")
jimmy.reveal_age
