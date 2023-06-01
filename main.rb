require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'classroom'
require_relative 'student'
require_relative 'book'
require_relative 'rental'

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name

math = Classroom.new('math')
st1 = Student.new(20, 'max')
st1.classroom = math
puts st1.name
puts st1.classroom.label
puts st1.classroom.students.map(&:name)

st2 = Student.new(20, 'mex')
st3 = Student.new(20, 'mix')
math.add_student(st2)
math.add_student(st3)

puts math.students.map(&:name)
puts math.students.length
puts st2.classroom.label

# creating 1 book
b1 = Book.new('BOOK1', 'AUTH1')
# creating 2 persons
p1 = Person.new(20, 'PERS1')
p2 = Person.new(30, 'PERS2')
# creating rentals
r1 = Rental.new('RENT1', b1, p1)
r2 = Rental.new('RENT2', b1, p1)
# rental with only date
r3 = Rental.new('RENT3')
# rental with date and person
r4 = Rental.new('RENT4', nil, p2)
# adding books to the rentals
b1.add_rental(r3)
b1.add_rental(r4)
# checking b1 rentals
puts(b1.rentals.map { |rental| rental.book.title })
# checking p1 rentals
puts p1.rentals.map(&:date)
# checking self assigned tental to p2
puts(p2.rentals.map { |rental| rental.book.title })
###
puts r1.person.name, r2.person.name
