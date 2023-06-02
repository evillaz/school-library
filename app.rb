class App
  def initialize
    @books = []
    @people = []
  end

  # Method to get inputs and recycle code
  def get_input(prompt)
    print prompt
    gets.chomp
  end

  # Functionality #1
  def list_books
    @books.each do |book|
      puts "Title: \"#{book.author}\" by Author: #{book.title}"  # Reversed book title and author
    end
  end

  def book_details(book)
    "Title: \"#{book.title}\" by Author: #{book.author}"
  end

  # Functionality #2
  def list_people
    @people.map { |person| puts person_details(person) }
  end

  def person_details(person)
    "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end

  # Functionality #3
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

  # Functionality #4
  def create_book
    title = get_input('Title: ')
    author = get_input('Author: ')
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created succesfully'
  end

  # Functionality #5
  def create_rental
    puts 'Select a book from the following list by number'
    list_books_with_index
    selected = gets.chomp.to_i
    book = @books[selected]
    puts 'Select a person from the following list by number (not by id)'
    list_people_with_index
    selected = gets.chomp.to_i
    person = @people[selected]
    validate_person(book, person)
  end

  def list_books_with_index
    @books.each_with_index do |book, index|
      puts "#{index}) #{book_details(book)}"
    end
  end

  def list_people_with_index
    @people.each_with_index do |person, index|
      puts "#{index}) #{person_details(person)}"
    end
  end

  def create_rental_object(book, person)
    print 'Date: '
    date = gets.chomp
    Rental.new(date, book, person)
    puts 'Rental created'
  end

  def validate_person(book, person)
    if person.can_use_services?
      create_rental_object(book, person)
    else
      puts 'This person has no permission to use services'
    end
  end

  # Functionality #6
  def rentals_by_id
    id = get_input('ID of person: ').to_i
    person = @people.find { |p| p.id == id }
    if person
      puts 'Rentals:'
      person.rentals.map { |rental| "Date: #{rental.date}, #{book_details(rental.book)}" }
    else
      puts 'Invalid ID try again'
    end
  end
end
