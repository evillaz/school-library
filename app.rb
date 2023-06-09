require 'json'
# Main app class
class App
  attr_accessor :books, :people, :data_preserver

  def initialize
    @books = Container.new
    @people = Container.new
    @rentals_container = Container.new
    @data_preserver = PreserveData.new(@people, @books, @rentals_container)
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
end
