require './lib/interface.rb'

RSpec.describe Interface do
  it 'exists and has attributes' do
    interface = Interface.new("GroupHealth")

    expect(interface).to be_instance_of(Interface)
    expect(interface.clinic).to be_instance_of(Clinic)
    expect(interface.clinic.name).to eq ("GroupHealth")
  end

  describe 'home_page' do
    it 'displays a welcome message and the 4 options for a user' do
      interface = Interface.new("Health Machine Inc.")

      expect(interface.home_page).to eq("Welcome to Health Machine Inc.\n
----------------------------------------------------
Choose an option below:

1) Display all patients\n
2) Display a patient's latest temperature records\n
3) Add a new patient\n
4) Add a new temperature record for a patient\n
5) Exit")
    end
  end

  
end