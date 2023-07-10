require './lib/clinic.rb'

RSpec.describe Clinic do
  it 'clinic exists and has attributes' do
    clinic_1 = Clinic.new("GroupHealth")
    
    expect(clinic_1).to be_instance_of(Clinic)
    expect(clinic_1.name).to eq("GroupHealth")
    expect(clinic_1.patients).to eq([])
  end

  describe 'add patient' do
    it 'can create a patient' do
      clinic_1 = Clinic.new("GroupHealth")
      
      clinic_1.new_patient("Mia", 21)

      expect(clinic_1.patients.count).to eq(1)
      expect(clinic_1.patients[0].name).to eq("Mia")
      expect(clinic_1.patients[0].age).to eq(21)
      expect(clinic_1.patients[0].temperature).to eq([])
    end
  end

  describe 'find_patient_by_name' do
    it 'can find the patient by name case insensitive' do
      clinic_1 = Clinic.new("GroupHealth")
      
      clinic_1.new_patient("Mia", 21)
      patient = clinic_1.find_patient_by_name("mia")

      expect(patient[0].name).to eq("Mia")
      expect(patient[0].age).to eq(21)
    end
  end

  #note, add an ID attribute to each patient for searching

  # describe 'patient latest temperatures' do
  #   it 'can return the temp records for a patient in a neat table' do
  #     clinic_1 = Clinic.new("GroupHealth")
      
  #     clinic_1.new_patient("Mia", 21)

  #     expect(clinic_1.patient_latest_temperatures("Mia")).to eq("Name\t Age\t Temperature Reading 1\t Timte\t Temperature Reading\t Fever\n
  #                                                               Mia\t 21\t ")
  #   end
  # end
end