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

  def latest_temperature_readings
    {
      temperature[-1].time => [temperature[-1].farenheit,
                               temperature[-1].celsius,
                               temperature[-1].kelvin],
      temperature[-2].time => [temperature[-2].farenheit,
                               temperature[-2].celsius,
                               temperature[-2].kelvin],
      temperature[-3].time => [temperature[-3].farenheit,
                               temperature[-3].celsius,
                               temperature[-3].kelvin]
    }
  end
end