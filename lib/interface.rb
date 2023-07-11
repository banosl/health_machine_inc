require './lib/clinic.rb'

class Interface
  attr_reader :clinic

  def initialize(name)
    @clinic = Clinic.new(name)
  end

  def home_page
    "Welcome to GroupHealth\n
        Choose an option below:\n
        
        1) Display all patients\n
        2) Display a patient's latest temperature records\n
        3) Add a new patient\n
        4) Add a new temperature record for a patient"
  end
end