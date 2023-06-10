require_relative '../trimmer_decorator'

describe TrimmerDecorator do
  before :each do
    person = double('Person', rentals: [])
    allow(person).to receive(:name) { 'Constantinople' }
    allow(person).to receive(:correct_name).and_return(person.name)
    @trimmer_decorator = TrimmerDecorator.new(person)
  end

  it '#correct_name should trim the length down to 10' do
    expect(@trimmer_decorator.correct_name).to eq('Constantin')
  end
end