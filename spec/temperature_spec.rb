require './lib/temperature.rb'
require './lib/patient.rb'

RSpec.describe Temperature do
  describe 'Patient' do  
    it 'temperature exists and has attributes' do
      temperature_1 = Temperature.new

      expect(temperature_1.celsius).to eq(0)
      expect(temperature_1.farenheit).to eq(0)
      expect(temperature_1.kelvin).to eq(0)
    end
  end

  describe 'record_temperature in farenheit and celsius' do
    before :each do
      @temperature_1 = Temperature.new
    end
    
    describe 'record_temperature_farenheit' do
      it 'can save temperature in farenheit' do
        expect(@temperature_1.farenheit).to eq(0)

        @temperature_1.record_temperature_farenheit(100)

        expect(@temperature_1.farenheit).to eq(100)
      end

      it 'updates the celsius and kelvin temperatures from the entered farenheit temp' do
        expect(@temperature_1.farenheit).to eq(0)
        expect(@temperature_1.celsius).to eq(0)
        expect(@temperature_1.kelvin).to eq(0)

        @temperature_1.record_temperature_farenheit(100)

        expect(@temperature_1.farenheit).to eq(100)
        expect(@temperature_1.celsius).to eq(37.78)
        expect(@temperature_1.kelvin).to eq(310.93)

        @temperature_1.record_temperature_farenheit(80)

        expect(@temperature_1.farenheit).to eq(80)
        expect(@temperature_1.celsius).to eq(26.67)
        expect(@temperature_1.kelvin).to eq(299.82)
      end
    end

    describe 'record_temperature_celsius' do
      it 'can save temperature in celsius' do
        expect(@temperature_1.celsius).to eq(0)

        @temperature_1.record_temperature_celsius(39)

        expect(@temperature_1.celsius).to eq(39)
      end

      it 'updates the farenheit and kelvin temperatures from the entered celsius temp' do
        expect(@temperature_1.farenheit).to eq(0)
        expect(@temperature_1.celsius).to eq(0)
        expect(@temperature_1.kelvin).to eq(0)

        @temperature_1.record_temperature_celsius(39)

        expect(@temperature_1.celsius).to eq(39)
        expect(@temperature_1.farenheit).to eq(102.2)
        expect(@temperature_1.kelvin).to eq(312.15)

        @temperature_1.record_temperature_celsius(28)

        expect(@temperature_1.celsius).to eq(28)
        expect(@temperature_1.farenheit).to eq(82.4)
        expect(@temperature_1.kelvin).to eq(301.15)
      end
    end
  end

  describe 'has_fever?' do
    before :each do
      @temperature_1 = Temperature.new
    end

    it 'can return TRUE for when a patient has a temperature of over 100.4 F, 38 C, 311.15 K' do
      @temperature_1.record_temperature_farenheit(101)

      expect(@temperature_1.farenheit).to eq(101)
      expect(@temperature_1.celsius).to eq(38.33)
      expect(@temperature_1.kelvin).to eq(311.48)
      expect(@temperature_1.has_fever?).to eq(true)
    end

    it 'can return FALSE for when a patient has a temperature below 100.4 F, 38 C, 311.15 K' do
      @temperature_1.record_temperature_farenheit(98.6)

      expect(@temperature_1.farenheit).to eq(98.6)
      expect(@temperature_1.has_fever?).to eq(false)
    end
  end
end