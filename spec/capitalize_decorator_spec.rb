require_relative '../capitalize_decorator'

describe CapitalizeDecorator do
  before :each do
    person = double('Person', rentals: [])
    allow(person).to receive(:name) { 'constantinople' }
    allow(person).to receive(:correct_name).and_return(person.name)
    @capitalize_decorator = CapitalizeDecorator.new(person)
  end

  it '#correct_name should capitalize the name' do
    expect(@capitalize_decorator.correct_name).to eq('Constantinople')
  end
end
