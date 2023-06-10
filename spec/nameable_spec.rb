require_relative '../nameable'
describe Nameable do
  nameable = Nameable.new
  it 'Should be instance of Nameable class' do
    expect(nameable).to be_instance_of Nameable
  end

  it 'Should raise a NotImplementedError' do
    expect { nameable.correct_name }.to raise_error(NotImplementedError)
  end
end
