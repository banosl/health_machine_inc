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
end