class Animal

  attr_reader :name, :age, :vocalization

  def name=(value)
    if value == ""
      raise "Name can't be blank!"
    end
    @name = value
  end

  def age=(value)
    if value < 0
      raise "An age of #{value} isn't valid!"
    end
    @age = value
  end

  def vocalization=(value)
    if value == ""
      raise "This animal needs to speak, give him a voice"
    end
    @vocalization = value
  end

  def talk
    puts "#{@name} says #{@vocalization}!"
  end

  def move(destination)
    puts "#{@name} runs to the #{destination}."
  end

  def report_age
    puts "#{@name} is #{@age} years old."
  end

end

class Dog < Animal
end
class Cat < Animal
end
class Bird < Animal
  def to_s
    "#{name} is a bird. She is #{age} year#{age > 1 ? "s" : ""} old"
  end
end
class Armadillo < Animal
  def move(destination)
    puts "#{@name} unrolls!"
    super
  end
end

snowy = Bird.new
snowy.vocalization = "Caw"
snowy.name = "Snowy"
snowy.age = 1
snowy.talk
puts snowy

arman = Armadillo.new
arman.name = "Arman"
arman.move("Shopify")

#puts arman.methods
