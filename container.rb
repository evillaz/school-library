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
