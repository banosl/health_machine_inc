require './lib/clinic.rb'

class Interface
  attr_reader :clinic
  
  def initialize(name)
    @clinic = Clinic.new(name)
  end

end