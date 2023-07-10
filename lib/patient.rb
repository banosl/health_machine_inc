require './lib/temperature.rb'

class Patient
  attr_reader :name, :age, :temperature

  def initialize(name, age)
    @name = name
    @age = age
    @temperature = []
  end

  def record_temperature(type, temp)
    @temperature << Temperature.new
    
    if type == "F"
      @temperature.last.record_temperature_farenheit(temp)
    elsif type == "C"
      @temperature.last.record_temperature_celsius(temp)
    end
  end
end