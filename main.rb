require_relative 'app'
require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
app = App.new

def display_options
  puts 'Please choose an option by entering a number'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

loop do
  display_options
  option = gets.chomp.to_i

  case option
  when 1
    app.books.list
  when 2
    app.people.list
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    puts app.create_rental
  when 6
    puts app.rentals_by_id
  when 7
    puts 'Thank you for using this app'
    break
  else
    puts 'Invalid option. Please try again'
  end
end
