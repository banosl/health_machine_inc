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
    i = 0
    patient = find_patient_by_name(name)

    output = "\n\nName\t Age\t Temperature Reading\t\t Date/Time\t\t Fever\n\n"
    patient.latest_temperature_readings.each do |k, v|
      output += "#{patient.name}\t #{patient.age}\t #{v[0]} F, #{v[1]} C, #{v[2]} K\t #{k.strftime("%a %b %e %H:%M")}\t #{patient.temperature[i].has_fever?}\n"
      i += 1
    end
    puts output
  end
end