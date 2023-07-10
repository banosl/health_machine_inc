class Temperature
  attr_reader :celsius, :farenheit, :kelvin

  def initialize
    @farenheit = 0
    @celsius = 0
    @kelvin = 0
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
    @farenheit = ((temp * 9 / 5.to_f) + 32).round(2)
    @kelvin = (@celsius + 273.15).round(2)
  end
end