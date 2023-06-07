require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, parent_permission)
    super(age, name, parent_permission: parent_permission)
    @classroom = nil
  end

  def classroom=(classroom)
    @classroom = classroom
    @classroom.students.push(self) unless @classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def to_json(*args)
    object = JSON.parse(super)
    object['classroom'] = @classroom
    object.to_json(*args)
  end
end
