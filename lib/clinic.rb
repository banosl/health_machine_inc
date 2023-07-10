require './lib/patient.rb'

class Clinic
  attr_reader :name, :patients

  def initialize(name)
    @name = name
    @patients = []
  end

  def new_patient(name, age)
    @patients << Patient.new(name, age)
  end
end