class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @book.rentals.push(self) if !@book.nil? && !@book.rentals.include?(self)
    @person = person
    @person.rentals.push(self) if !@person.nil? && !@person.rentals.include?(self)
  end

  def to_json(*_args)
    {
      'date' => @date,
      'book' => @book.to_json,
      'person' => @person.to_json
    }.to_json(*_args)
  end
end
