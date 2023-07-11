require './lib/clinic.rb'

class Interface
  attr_reader :clinic

  def initialize(name)
    @clinic = Clinic.new(name)
  end

  def home_page
  puts "\n\nWelcome to Health Machine Inc.\n
----------------------------------------------------
Choose an option below:

1) Display all patients\n
2) Display a patient's latest temperature records\n
3) Add a new patient\n
4) Add a new temperature record for a patient\n
5) Exit
---------------------------------------------------\n\n"

    input = gets.chomp
    
    execute_options(input)
  end
  
  #gotta break these down into smaller methods

  def execute_options(input)
    if input == "1" #Display all patients
      puts display_all_patients
      
      return_to_home
    elsif input == "2" #Display a patient's latest temperature records
      puts "\nEnter the patient's name:"
      name = gets.chomp.split.map(&:capitalize).join(' ')

      if clinic.find_patient_by_name(name)
        display_patient_latest_temp_records(name)
      else
        puts "\n\nThat patient doesn't exist.\n\n"
        home_page
      end
      
      return_to_home
    elsif input == "3" #Add a new patient
      puts "\nEnter the patient's name:"
      name = gets.chomp.split.map(&:capitalize).join(' ')
      puts "\nEnter the patient's age:"
      age = gets.chomp

      until (age.match? /[a-zA-z]/) == false
        puts "Please only enter a numerical value."
        age = gets.chomp
      end 

      puts add_a_new_patient(name, age.to_i)
      
      return_to_home
    elsif input == "4" #Add a new temperature record for a patient
      puts "\nEnter the patient's name"
      name = gets.chomp.split.map(&:capitalize).join(' ')

      until @clinic.find_patient_by_name(name)
        puts "\nThat patient does not exist. Please enter an existing patient."
        name = gets.chomp.split.map(&:capitalize).join(' ')
      end
      
      puts "\nEnter 'F' for a Farenheit reading or 'C' for a Celsius reading:"
      type = gets.chomp.capitalize

      until type == 'F' || type == "C"
        puts "Please enter only F or C."
        type = gets.chomp.capitalize
      end

      puts "\nEnter the temperature reading:"
      temp = gets.chomp

      until (temp.match? /[a-zA-z]/) == false
        puts "Please only enter a numerical value."
        temp = gets.chomp
      end

      puts add_a_new_temperature_record_for_patient(name, type, temp.to_f)
      
      return_to_home
    elsif input == "5" #Exit
      puts "\nThank you. Goodbye.\n"
    else #Wrong input
      puts "Please enter an option between 1 & 5"
      home_page
    end
  end

  def display_all_patients
    message = ["----------------------------------------------------","\nName\t Age\n\n"]

    @clinic.patients.each do|patient|
      message << "#{patient.name}\t #{patient.age}\n\n"
    end

    message.last.chomp!.chomp!
    message.join(",").gsub(",", "") + "\n\n"
  end
  
  def add_a_new_patient(name, age)
    patients = @clinic.new_patient(name, age)
    
    "\n#{patients.last.name} has been added to the system.\n-----------------------------------------------------"
  end
 
  def display_patient_latest_temp_records(name)
    @clinic.patient_latest_temperatures(name)
  end

  def add_a_new_temperature_record_for_patient(name, type, temp)
    patient = @clinic.find_patient_by_name(name)
    patient.record_temperature(type, temp)

    "\nA new temperature reading has been added to #{patient.name}'s record.\n-----------------------------------------------------"
  end

  def return_to_home
    puts "\nEnter '1' to return to the home page or enter '2' to exit."
    input = gets.chomp

    if input == "1"
      home_page
    else
      "\nThank you. Goodbye.\n"
    end
  end
end