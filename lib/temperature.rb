class Temperature
  attr_reader :celsius, :farenheit, :kelvin

  def initialize
    @celsius = 37.00
    @farenheit = 98.6
    @kelvin = 310.15
  end

  def has_fever?
    @farenheit >= 100.4
  end

  def record_temperature_farenheit(temp)
    @farenheit = temp
    @celsius = ((temp - 32) * 5 / 9.to_f).round(2)
    @kelvin = (@celsius + 273.15).round(2)
  end

  def record_temperature_celsius(temp)
    @celsius = temp
  end
end