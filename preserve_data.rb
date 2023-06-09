class PreserveData
  def initialize(people, books, rentals)
    @people = people
    @books = books
    @rentals_container = rentals
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
