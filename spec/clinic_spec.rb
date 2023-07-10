require './lib/clinic.rb'

RSpec.describe Clinic do
  it 'clinic exists and has attributes' do
    clinic_1 = Clinic.new("GroupHealth")
    
    expect(clinic_1).to be_instance_of(Clinic)
    expect(clinic_1.name).to eq("GroupHealth")
    expect(clinic_1.patients).to eq([])
  end
end