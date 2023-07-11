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

      expect(clinic_1.patient_latest_temperatures("Mia")).to eq("\n\nName\t Age\t Temperature Reading\t\s\s Date/Time\t\t Fever\n
#{patient.name}\t #{patient.age}\t #{record_1[1][0]} F, #{record_1[1][1]} C, #{record_1[1][2]} K\s #{record_1[0].strftime("%a %b %e %H:%M")}\t #{patient.temperature[0].has_fever?}
#{patient.name}\t #{patient.age}\t #{record_1[1][0]} F, #{record_1[1][1]} C, #{record_1[1][2]} K\s #{record_2[0].strftime("%a %b %e %H:%M")}\t #{patient.temperature[1].has_fever?}
#{patient.name}\t #{patient.age}\t #{record_1[1][0]} F, #{record_1[1][1]} C, #{record_1[1][2]} K\s #{record_3[0].strftime("%a %b %e %H:%M")}\t #{patient.temperature[2].has_fever?}")
    end
  end
end