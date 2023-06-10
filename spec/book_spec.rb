require_relative '../book'
require_relative '../rental'

describe Book do
    describe '#initialize' do
        it 'Creates a new book' do
        book = Book.new('title', 'author')
        expect(book).to be_a(Book)
        end
    end
    
    describe 'check attributes' do
        it 'checks title' do
            book = Book.new('title', 'author')
            expect(book.title).to eq('title')
        end
        it 'checks author' do
            book = Book.new('title', 'author')
            expect(book.author).to eq('author')
        end
    end
end