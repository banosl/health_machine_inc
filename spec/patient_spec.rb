require './lib/patient.rb'

RSpec.describe Patient do
  it 'patient exists and has attributes' do
    patient_1 = Patient.new("James", 43)

    expect(patient_1).to be_instance_of(Patient)
    expect(patient_1.name).to eq("James")
    expect(patient_1.age).to eq(43)
    expect(patient_1.temperature).to be_instance_of(Temperature)
  end


end