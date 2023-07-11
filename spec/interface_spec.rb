require './lib/interface.rb'

RSpec.describe Interface do
  it 'exists and has attributes' do
    interface = Interface.new("GroupHealth")

    expect(interface).to be_instance_of(Interface)
    expect(interface.clinic).to be_instance_of(Clinic)
    expect(interface.clinic.name).to eq ("GroupHealth")
  end
end