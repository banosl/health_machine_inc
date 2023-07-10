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
end