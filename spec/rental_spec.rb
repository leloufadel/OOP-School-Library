require_relative '../book'
require_relative '../rental'
require_relative '../person'

RSpec.describe Book do
  let(:book) { Book.new('Book Title', 'Author Name') }

  describe '#initialize' do
    it 'creates a Book object with the provided title and author' do
      expect(book.title).to eq('Book Title')
      expect(book.author).to eq('Author Name')
    end

    it 'initializes rentals as an empty array' do
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    it 'creates a new rental associated with the book and person' do
      person = Person.new(18, 'John Doe')
      date = Date.new(2023, 9, 15)
      rental = book.add_rental(date, person)

      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end

    it 'adds the rental to the book' do
      person = Person.new(18, 'John Doe')
      date = Date.new(2023, 9, 15)
      rental = book.add_rental(date, person)

      expect(book.rentals).to include(rental)
    end
  end

  describe '#to_s' do
    it 'returns a formatted string with book information' do
      expected_string = 'Title: Book Title, Author: Author Name'
      expect(book.to_s).to eq(expected_string)
    end
  end
end
