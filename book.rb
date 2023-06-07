class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end

  def details
    "Title: \"#{@title}\" by Author: #{@author}"
  end

  def to_json(*args)
    {
      'title' => @title,
      'author' => @author
    }.to_json(*args)
  end

  def self.from_json(object)
    self.new(object['title'], object['author'])
  end
end
