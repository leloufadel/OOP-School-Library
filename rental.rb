require 'date'
class Rental
  def initialize(date, book, person)
    @date = date
    @book = book
    @book.rentals << self
    @person = person
    @person.rentals << self
  end
  attr_accessor :date, :book, :person

  def to_s
    "Book-#{@book}, Date: #{@date}"
  end
end
