require './lib/clinic.rb'

class Interface
  attr_reader :clinic

  def initialize(name)
    @clinic = Clinic.new(name)
  end

  def home_page
    "Welcome to Health Machine Inc.\n
----------------------------------------------------
Choose an option below:

1) Display all patients\n
2) Display a patient's latest temperature records\n
3) Add a new patient\n
4) Add a new temperature record for a patient\n
5) Exit"
  end

  def execute_options(input)
    #add the return to home option here
    if input == "1"
      display_all_patients
    elsif input == "2"
      puts "Enter the patient's name:"
      name = gets.chomp.split.map(&:capitalize).join(' ')

      display_patient_latest_temp_records(name)

      puts "Enter '1' to return to the home page or enter '2' to exit."
      response = gets.chomp

      while response != "1" || response != "2"
        puts "Enter '1' to return to the home page or enter '2' to exit."
        response = gets.chomp
      end
      
      return_to_home(response)
    elsif input == "3"
      puts "Enter the patient's name:"
      name = gets.chomp.split.map(&:capitalize).join(' ')
      puts "Enter the patient's age:"
      age = gets.chomp.to_i
      add_a_new_patient(name, age)
    elsif input == "4"
      puts "Enter the patient's name"
      name = gets.chomp.split.map(&:capitalize).join(' ')

      puts "Enter 'F' for a Farenheit reading or 'C' for a Celsius reading:"
      type = gets.chomp.capitalize

      while type != "F" || type != "C"
          puts "Please enter either 'F' for Farenheit or 'C' for Celsius only."
          type = gets.chop.capitalize
      end

      puts "Enter the temperature reading:"
      temp = gets.chomp.to_f

      add_a_new_temperature_record_for_patient(name, type, temp)
    elsif input == "5"
      puts "Thank you. Goodbye."
    end
  end

  def display_all_patients
    message = ["Name\t Age\n\n"]

    @clinic.patients.each do|patient|
      message << "#{patient.name}\t #{patient.age}\n\n"
    end

    message.last.chomp!.chomp!
    message.join(",").gsub(",", "")
  end
  
  def add_a_new_patient(name, age)
    patients = @clinic.new_patient(name, age)
    
    puts "#{patients.last.name} has been added to the system."
  end
 
  def display_patient_latest_temp_records(name)
    @clinic.patient_latest_temperatures(name)
  end

  def add_a_new_temperature_record_for_patient(name, type, temp)
    patient = @clinic.find_patient_by_name(name)
    patient.record_temperature(type, temp)

    puts "A new temperature reading has been added to #{patient.name}'s record."
  end

  def return_to_home(input)
    if input == "1"
      home_page
    else
      "Thank you. Goodbye."
    end
  end
end