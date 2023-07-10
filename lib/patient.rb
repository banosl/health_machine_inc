require './lib/temperature.rb'

class Patient
  attr_reader :name, :age, :temperature

  def initialize(name, age)
    @name = name
    @age = age
    @temperature = Temperature.new
  end
end