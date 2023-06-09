require_relative 'nameable'

class Person < Nameable
  attr_accessor :id, :name, :age, :rentals, :parent_permission

  def initialize(age, name, parent_permission: true)
    super()
    @id = rand(1..300)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  def details
    "[#{self.class}] Name: #{@name}, ID: #{@id}, Age: #{@age}"
  end

  def to_json(*args)
    {
      'id' => @id,
      'class' => self.class,
      'name' => @name,
      'age' => @age,
      'parent_permission' => @parent_permission
    }.to_json(*args)
  end

  def self.from_json(object)
    person = new(object['age'], object['name'], parent_permission: object['parent_permission'])
    person.id = object['id'].to_i
    person
  end

  private

  def of_age?
    @age >= 18
  end
end
