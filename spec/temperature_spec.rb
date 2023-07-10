require './lib/temperature.rb'
require './lib/patient.rb'

RSpec.describe Temperature do
  describe 'Patient' do  
    it 'patient has default temperatures in celsius, farenheit, and kelvin' do
      patient_1 = Patient.new("James", 43)

      expect(patient_1.temperature.celsius).to eq(37)
      expect(patient_1.temperature.farenheit).to eq(98.6)
      expect(patient_1.temperature.kelvin).to eq(310.15)
    end
  end

  describe 'measure_temperature' do

  end

  describe 'has_fever?' do
    before :each do
      @patient_1 = Patient.new("James", 43)
      @patient_2 = Patient.new("Sandra", 22)
    end

    xit 'can return TRUE for when a patient has a temperature of over 100.4 F, 38 C, 311.15 K' do
      expect(@patient_1.temperature.has_fever?).to eq(true)
    end

    it 'can return FALSE for when a patient has a temperature below 100.4 F, 38 C, 311.15 K' do
      expect(@patient_2.temperature.farenheit).to eq(98.6)
      expect(@patient_2.temperature.has_fever?).to eq(false)
    end
  end
end