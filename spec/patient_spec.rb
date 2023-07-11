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

  describe 'latest_temperature_readings' do
    it 'returns the last 3 temperature readings on record with the time' do
      patient_1 = Patient.new("James", 43)

      patient_1.record_temperature("F", 99)
      patient_1.record_temperature("F", 98)
      patient_1.record_temperature("F", 95)
      patient_1.record_temperature("F", 97)

      expect(patient_1.temperature.count).to eq(4)
      expect(patient_1.latest_temperature_readings).to eq({
                                                            patient_1.temperature[-1].time => [patient_1.temperature[-1].farenheit, 
                                                                                               patient_1.temperature[-1].celsius, 
                                                                                               patient_1.temperature[-1].kelvin],
                                                            patient_1.temperature[-2].time => [patient_1.temperature[-2].farenheit, 
                                                                                               patient_1.temperature[-2].celsius, 
                                                                                               patient_1.temperature[-2].kelvin],
                                                            patient_1.temperature[-3].time => [patient_1.temperature[-3].farenheit, 
                                                                                               patient_1.temperature[-3].celsius, 
                                                                                               patient_1.temperature[-3].kelvin]
      })
      #need a test for checking that it doesn't have the 4th oldest record
    end

    it 'returns the latest temperature readings even if there is only one' do
      patient_1 = Patient.new("James", 43)
      patient_1.record_temperature("F", 99)

      expect(patient_1.temperature.count).to eq(1)
      expect(patient_1.latest_temperature_readings).to eq({
                                                            patient_1.temperature[-1].time => [patient_1.temperature[-1].farenheit, 
                                                                                               patient_1.temperature[-1].celsius, 
                                                                                               patient_1.temperature[-1].kelvin]})
    end
  end
end