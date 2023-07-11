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

  describe 'display_all_patients' do
    it 'displays the names and ages of patiens on record in a table' do
      interface = Interface.new("Health Machine Inc.")

      interface.clinic.new_patient("Margo", 64)
      interface.clinic.new_patient("Bennet", 24)
      interface.clinic.new_patient("James", 13)

      expect(interface.display_all_patients).to eq("Name\t Age\n
Margo\t 64\n
Bennet\t 24\n
James\t 13")
    end
  end

  describe "add_a_new_patient" do
    it 'can add a patient to the clinic and display a confirmation message' do
      interface = Interface.new("Health Machine Inc.")

      expect(interface.clinic.patients).to eq([])

      interface.add_a_new_patient("Marge", 54)

      expect(interface.clinic.patients.first.name).to eq("Marge")
      expect(interface.clinic.patients.first.age).to eq(54)

      expect(interface.add_a_new_patient("Billy", 16)).to eq("Billy has been added to the system.")
    end
  end
end