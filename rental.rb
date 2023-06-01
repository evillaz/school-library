class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book = nil, person = nil)
    @date = date
    @book = book
    @book.rentals.push(self) if !@book.nil? && !@book.rentals.include?(self)
    @person = person
    return unless !@person.nil? && !@person.rentals.include?(self)

    @person.rentals.push(self)
  end
end
