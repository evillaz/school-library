require_relative '../rental'
require_relative '../book'
require_relative '../student'

describe Rental do
    describe '#initialize' do
        it 'Creates a new rental' do
        book = Book.new('title', 'author')
        student = Student.new(20, 'name', true)
        rental = Rental.new('DD/MM/YYYY', book, student)
        expect(rental).to be_a(Rental)
        end
    end
    
    describe 'check attributes' do
        it 'checks book' do
            book = Book.new('title', 'author')
            student = Student.new(20, 'name', true)
            rental = Rental.new('DD/MM/YYYY', book, student)
            expect(rental.book).to eq(book)
        end
    end
end