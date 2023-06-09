require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, name, specialization, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*args)
    object = JSON.parse(super)
    object['specialization'] = @specialization
    object.to_json(*args)
  end

  def self.from_json(object)
    new(object['age'], object['name'], object['specialization'], parent_permission: object['parent_permission'])
  end
end
