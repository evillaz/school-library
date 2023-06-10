require_relative '../decorator'
require_relative '../nameable'

describe 'Decorator' do
  nameable = Nameable.new
  decorator = Decorator.new(nameable)
  it 'should be instance of Decorator' do
    expect(decorator).to be_instance_of(Decorator)
  end

  it 'checks correct_name method raise a not implemented error' do
    expect { decorator.correct_name }.to raise_error(NotImplementedError)
  end
end
