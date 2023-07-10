require 'pry'
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
    end
  end
end