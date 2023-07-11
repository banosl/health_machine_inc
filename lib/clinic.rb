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

    puts  "\n\nName\t Age\t Temperature Reading\t\s\s\s\s Date/Time\t\t Fever\n"

    patient.latest_temperature_readings.each do |k, v|
      puts "#{patient.name}\t #{patient.age}\t #{v[0]} F, #{v[1]} C, #{v[2]} K\s\s #{k.strftime("%a %b %e %H:%M")}\t #{patient.temperature[i].has_fever?}"
      i += 1
    end
  end
end