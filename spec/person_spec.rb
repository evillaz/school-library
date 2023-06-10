require_relative '../person'
require_relative '../book'
require_relative '../rental'

describe Person do
  describe '#initialize' do
    it 'Creates a new person' do
      person = Person.new(20, 'name')
      expect(person).to be_a(Person)
    end
  end

  describe 'check attributes' do
    it 'checks age' do
      person = Person.new(20, 'name')
      expect(person.age).to eq(20)
    end
    it 'checks name' do
      person = Person.new(20, 'name')
      expect(person.name).to eq('name')
    end
  end
end
