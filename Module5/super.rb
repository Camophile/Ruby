class Boxer
  attr_reader :name
  def initialize(name)
    if name.to_i > 0       
      raise "#{name} isn't a valid name"
    elsif name.empty? || name == " "
      raise "name can't be empty"
    else
      @name = name
    end
  end
end

ali = Boxer.new("Mohammad")
p ali.name

foreman = Boxer.new("George")
p foreman.name
