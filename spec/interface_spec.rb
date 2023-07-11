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

  describe 'display_patient_latest_temp_records' do
    it 'shows a patients last 3 temperature readings after inputing patient name' do
      interface = Interface.new("Health Machine Inc.")
      interface.add_a_new_patient("Marge", 54)

      patient = interface.clinic.patients.last

      patient.record_temperature("C", 29)
      patient.record_temperature("C", 28)
      patient.record_temperature("C", 30)

      record_1 = patient.latest_temperature_readings.to_a[0]
      record_2 = patient.latest_temperature_readings.to_a[1]
      record_3 = patient.latest_temperature_readings.to_a[2]

      expect(interface.display_patient_latest_temp_records("Marge")).to eq("Name\t Age\t Temperature Reading\t\s\s Date/Time\t\t Fever\n
#{patient.name}\t #{patient.age}\t #{record_1[1][0]} F, #{record_1[1][1]} C, #{record_1[1][2]} K\s #{record_1[0].strftime("%a %b %e %H:%M")}\t #{patient.temperature[0].has_fever?}
#{patient.name}\t #{patient.age}\t #{record_1[1][0]} F, #{record_1[1][1]} C, #{record_1[1][2]} K\s #{record_2[0].strftime("%a %b %e %H:%M")}\t #{patient.temperature[1].has_fever?}
#{patient.name}\t #{patient.age}\t #{record_1[1][0]} F, #{record_1[1][1]} C, #{record_1[1][2]} K\s #{record_3[0].strftime("%a %b %e %H:%M")}\t #{patient.temperature[2].has_fever?}")
    end
  end

  describe 'add_a_new_temperature_record_for_patient' do
    it 'creates a new temperature record for a given patient' do
      interface = Interface.new("Health Machine Inc.")
      interface.add_a_new_patient("Marge", 54)

      patient = interface.clinic.patients.last

      interface.add_a_new_temperature_record_for_patient("Marge", "F", 98.6)

      expect(patient.temperature.last.farenheit).to eq(98.6)
      expect(interface.add_a_new_temperature_record_for_patient("Marge", "F", 101)).to eq("A new temperature reading has been added to Marge's record.")
    end
  end

#   describe 'execute_options' do
#     it 'returns all patients currently on record when option 1 is given' do
#       interface = Interface.new("Health Machine Inc.")

#       interface.clinic.new_patient("Margo", 64)
#       interface.clinic.new_patient("Bennet", 24)
#       interface.clinic.new_patient("James", 13)

#       expect(interface.execute_options("1")).to eq("Name\t Age\n
# Margo\t 64\n
# Bennet\t 24\n
# James\t 13")
#     end

#     it 'prompts user to enter patient info when option 2 is given' do
#       interface = Interface.new("Health Machine Inc.")
#       binding.pry
#       # expect(interface.execute_options("2")).to eq("Enter patient name:")
#     end
#   end

  # describe 'return_to_home' do
  #   it 'prompts user to return to home or exit' do
  #     interface = Interface.new("Health Machine Inc.")

  #     expect(interface.return_to_home("Y")).to eq(interface.home_page)
  #   end
  # end
end