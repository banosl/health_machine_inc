require 'pry'
require './lib/patient.rb'

RSpec.describe Patient do
  it 'patient exists and has attributes' do
    patient_1 = Patient.new("James", 43)

    expect(patient_1).to be_instance_of(Patient)
    expect(patient_1.name).to eq("James")
    expect(patient_1.age).to eq(43)
    expect(patient_1.temperature).to eq([])
  end

  describe 'record_temperature' do
    it 'adds a temperature reading to patients temperature attr' do
      patient_1 = Patient.new("James", 43)

      patient_1.record_temperature("F", 99)

      expect(patient_1.temperature.last).to be_instance_of(Temperature)
      expect(patient_1.temperature.last.farenheit).to eq(99)
      expect(patient_1.temperature.last.celsius).to eq(37.22)
      expect(patient_1.temperature.last.kelvin).to eq(310.37)
    end
  end
end