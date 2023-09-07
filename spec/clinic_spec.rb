require 'simplecov'
SimpleCov.start
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

      expect(patient.name).to eq("Mia")
      expect(patient.age).to eq(21)
    end
  end

  #note, add an ID attribute to each patient for searching so that there are no duplicate patients pulled with the same name.

  describe 'patient latest temperatures' do
    it 'can return the temp records for a patient in a neat table' do
      clinic_1 = Clinic.new("GroupHealth")
      
      clinic_1.new_patient("Mia", 21)
      patient = clinic_1.find_patient_by_name("mia")
      patient.record_temperature("F", 99)
      patient.record_temperature("F", 98)
      patient.record_temperature("F", 100)
   
      record_1 = patient.latest_temperature_readings.to_a[0]
      record_2 = patient.latest_temperature_readings.to_a[1]
      record_3 = patient.latest_temperature_readings.to_a[2]

      expected_output = "\n\nName\t Age\t Temperature Reading\t\t Date/Time\t\t Fever\n\nMia\t 21\t 100 F, 37.78 C, 310.93 K\t #{record_1[0].strftime("%a %b %e %H:%M")}\t No\nMia\t 21\t 98 F, 36.67 C, 309.82 K\t #{record_2[0].strftime("%a %b %e %H:%M")}\t No\nMia\t 21\t 99 F, 37.22 C, 310.37 K\t #{record_3[0].strftime("%a %b %e %H:%M")}\t No\n"
      expect {clinic_1.patient_latest_temperatures("Mia")}.to output(expected_output).to_stdout
    end
  end
end