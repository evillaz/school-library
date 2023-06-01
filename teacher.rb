require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, classroom, name, parent_permission: true)
    super(age, parent_permission: parent_permission, name: name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

te = Teacher.new(20, ' 2asd', 'asd')
