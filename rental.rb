class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book = nil, person = nil)
    @date = date
    @book = book
    @book.rentals.push(self) if !@book.nil? && !@book.rentals.include?(self)
    @person = person
    @person.rentals.push(self) if !@person.nil? && !@person.rentals.include?(self)
  end
end
