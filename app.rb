# Defined a class to hanlde the books and persons created
require 'json'

class Container
  attr_accessor :array

  def initialize
    @array = []
  end

  def push(element)
    @array.push(element)
  end

  def list
    @array.each do |element|
      puts element.details
    end
  end

  def list_with_index
    @array.each_with_index do |element, index|
      puts "#{index}) #{element.details}"
    end
  end

  def get_element(index)
    @array[index]
  end

  def find(id)
    @array.find { |p| p.id == id }
  end

  def save(filename)
    data = @array.to_json
    File.write(filename, data)
  end

  def load(filename)
    file_source = File.read(filename)
    JSON.parse(file_source)
  end
end

# Main app class
class App
  attr_accessor :books, :people

  def initialize
    @books = Container.new
    @people = Container.new
    @rentals_container = Container.new
  end

  # Method to get inputs and recycle code
  def get_input(prompt)
    print prompt
    gets.chomp
  end

  # Create a person
  def create_person
    type = get_input('Do you want to create a student(1) or a teacher(2)? [Input the number]: ').to_i
    age = get_input('Age: ').to_i
    name = get_input('Name: ')
    if type == 1
      create_student(age, name)
    elsif type == 2
      create_teacher(age, name)
    end
    puts 'Person created succesfully'
  end

  # Helper methods
  def create_student(age, name)
    if age < 18
      permission = get_input('Has parent permission? [Y/N]: ').capitalize
      permission = (permission == 'Y')
    else
      permission = true
    end
    student = Student.new(age, name, permission)
    @people.push(student)
  end

  def create_teacher(age, name)
    specialization = get_input('Specialization: ')
    teacher = Teacher.new(age, name, specialization)
    @people.push(teacher)
  end

  # Create a book
  def create_book
    title = get_input('Title: ')
    author = get_input('Author: ')
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created succesfully'
  end

  # Create rental selecting a book and a person
  def create_rental
    book = select_item('Select a book from the following list by number', @books)
    person = select_item('Select a person from the following list by number (not by id)', @people)
    validate_person(book, person)
  end

  # Helper methods
  def select_item(prompt, array)
    puts prompt
    array.list_with_index
    selected = gets.chomp.to_i
    array.get_element(selected)
  end

  def create_rental_object(book, person)
    date = get_input('Date: ')
    rental = Rental.new(date, book, person)
    @rentals_container.push(rental)
    puts 'Rental created'
  end

  def validate_person(book, person)
    if person.can_use_services?
      create_rental_object(book, person)
    else
      puts 'This person has no permission to use services'
    end
  end

  # Search rental by id
  def rentals_by_id
    id = get_input('ID of person: ').to_i
    person = @people.find(id)
    if person
      puts 'Rentals:'
      person.rentals.map { |rental| "Date: #{rental.date}, #{rental.book.details}" }
    else
      puts 'Invalid ID try again'
    end
  end

  def preserve_data
    @people.save('people.json')
    @books.save('books.json')
    @rentals_container.save('rentals.json')
  end

  def validate_class(person)
    object = if person['class'] == 'Teacher'
               Teacher.from_json(person)
             else
               Student.from_json(person)
             end
    object.id = person['id']
    object
  end

  def load_person(person)
    object = validate_class(person)
    @people.push(object)
  end

  def load_book(book)
    object = Book.from_json(book)
    @books.push(object)
  end

  def match_rental_person(rental)
    parsed_person = JSON.parse(rental['person'])
    id = parsed_person['id']
    rental_person = @people.find(id)
    unless rental_person
      rental_person = validate_class(parsed_person)
      @people.push(rental_person)
    end
    rental_person
  end

  def match_rental_book(rental)
    parsed_book = JSON.parse(rental['book'])
    rental_book = ''
    @books.array.each do |book|
      if  book.title == parsed_book['title'] &&
          book.author == parsed_book['author']
        rental_book = book
      end
    end
    if rental_book == ''
      rental_book = Book.new(parsed_book['title'], parsed_book['author'])
      @books.push(rental_book)
    end
    rental_book
  end

  def load_rental(rental)
    rental_person = match_rental_person(rental)
    rental_book = match_rental_book(rental)
    rental_object = Rental.new(rental['date'], rental_book, rental_person)
    @rentals_container.push(rental_object)
  end

  def load_data
    people_file = 'people.json'
    books_file = 'books.json'
    rentals_file = 'rentals.json'
    if File.exist?(people_file)
      people_data = @people.load(people_file)
      people_data.each do |person|
        load_person(person)
      end
    end
    if File.exist?(books_file)
      books_data = @books.load('books.json')
      books_data.each do |book|
        load_book(book)
      end
    end
    return unless File.exist?(rentals_file)

    rentals_data = @rentals_container.load('rentals.json')
    rentals_data.each do |rental|
      load_rental(rental)
    end
  end
end
