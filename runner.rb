#call the home_page method
#request user input

#call the execute options method
#at the end of each method display the return to home button

require './lib/interface.rb'
require './lib/clinic.rb'
require './lib/temperature.rb'
require './lib/patient.rb'

interface = Interface.new("Health Machine Inc.")

interface.home_page