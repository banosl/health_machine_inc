class Temperature
  attr_reader :celsius, :farenheit, :kelvin, :time

  def initialize
    @farenheit = 0
    @celsius = 0
    @kelvin = 0
    @time = 0
  end

  def has_fever?
    if @farenheit >= 100.4
      "Yes"
    else
      "No"
    end
  end

  def record_temperature_farenheit(temp)
    @farenheit = temp
    @celsius = ((temp - 32) * 5 / 9.to_f).round(2)
    @kelvin = (@celsius + 273.15).round(2)
    @time = Time.now
  end

  def record_temperature_celsius(temp)
    @celsius = temp
    @farenheit = ((temp * 9 / 5.to_f) + 32).round(2)
    @kelvin = (@celsius + 273.15).round(2)
    @time = Time.now
  end
end