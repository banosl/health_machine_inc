require './lib/patient.rb'

class Clinic
  attr_reader :name, :patients
  
  def initialize(name)
    @name = name
    @patients = []
  end
end