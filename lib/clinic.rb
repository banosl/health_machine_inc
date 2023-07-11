require 'pry'
require 'date'
require './lib/patient.rb'

class Clinic
  attr_reader :name, :patients

  def initialize(name)
    @name = name
    @patients = []
  end

  def new_patient(name, age)
    @patients << Patient.new(name, age)
  end

  def find_patient_by_name(input)
    name = input.split.map(&:capitalize).join(' ')

    @patients.select do |patient|
      patient.name.include?(name)
    end.first
  end

  def patient_latest_temperatures(name)
    patient = find_patient_by_name(name)
    record_1 = patient.latest_temperature_readings.to_a[0]
    record_2 = patient.latest_temperature_readings.to_a[1]
    record_3 = patient.latest_temperature_readings.to_a[2]

    "\n\nName\t Age\t Temperature Reading\t\s\s Date/Time\t\t Fever\n
#{patient.name}\t #{patient.age}\t #{record_1[1][0]} F, #{record_1[1][1]} C, #{record_1[1][2]} K\s #{record_1[0].strftime("%a %b %e %H:%M")}\t #{patient.temperature[0].has_fever?}
#{patient.name}\t #{patient.age}\t #{record_1[1][0]} F, #{record_1[1][1]} C, #{record_1[1][2]} K\s #{record_2[0].strftime("%a %b %e %H:%M")}\t #{patient.temperature[1].has_fever?}
#{patient.name}\t #{patient.age}\t #{record_1[1][0]} F, #{record_1[1][1]} C, #{record_1[1][2]} K\s #{record_3[0].strftime("%a %b %e %H:%M")}\t #{patient.temperature[2].has_fever?}"
  end
end