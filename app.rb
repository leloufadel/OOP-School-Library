require './teacher'
require './student'
require './person'
require './base_decorator'
require './capitalize_decorator'
require './trimmer_decorator'
require './nameable'
require './book'
require './classroom'
require './rental'
require './app'

class App
  attr_reader :people, :books, :rents

  def initialize()
    @people = []
    @books = []
    @rents = []
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp[0, 1].downcase == 'y'

    if age.positive? && name.strip.length.positive?
      student = Student.new(age, name, parent_permission)
      if student
        puts 'Person created successfully'
        return student
      else
        puts 'Failed to create a person'
      end
    else
      puts 'Failed to create a person'
    end

    student
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp

    if age.positive? && name.strip.length.positive?
      teacher = Teacher.new(age, name, specialization)
      if teacher
        puts 'Person created successfully'
        teacher
      else
        puts 'Failed to create a person'
      end
    else
      puts 'Failed to create a person'
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    if title.strip.size.positive? && author.strip.size.positive?
      book = Book.new(title, author)
      if book
        puts 'Book created successfully'
        @books << book
      else
        puts 'Failed to create a book'
      end
    else
      puts 'Failed to create a book'
    end
  end

  def create_rent
    puts 'Select a book from the following list by number'
    @books.each_with_index { |b, i| puts "#{i}) Title: #{b.title}, Author: #{b.author}" }
    book = @books[gets.chomp.to_i]

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index { |per, i| puts "#{i}) [#{per.type}] Name: #{per.name}, ID: #{per.id}, Age: #{per.age}" }
    person = @people[gets.chomp.to_i]

    print 'Date: '
    date = gets.chomp
    if date.strip.size.positive?
      rent = Rental.new(date, book, person)
      if rent
        puts 'Rental created successfully'
        @rents << rent
      else
        puts 'Failed to create a rent'
      end
    else
      puts 'Failed to create a rent'
    end
  end

  def student_or_teacher
    print 'Do u wanna create a student(1) or teacher(2)? [Input the number]: '
    opt3 = gets.chomp.to_i
    case opt3
    when 1
      student = create_student
      @people << student if student
    when 2
      teacher = create_teacher
      @people << teacher if teacher
    end
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    @rents.each do |rent|
      puts "Date: #{rent.date}, Book \"#{rent.book.title}\" by \"#{rent.book.author}\"" if rent.person.id == id
    end
  end

  def start
    puts
    puts 'Please choose an option by enter a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person ID'
    puts '7 - Exit'

    gets.chomp.to_i
  end

  def run # rubocop:disable Metrics/CyclomaticComplexity
    100.times do
      opt = start

      case opt
      when 1
        books.each { |b| puts "Title: \"#{b.title}\"; Author: \"#{b.author}\"" }
      when 2
        people.each { |per| puts "[#{per.type}] Name: #{per.name}, ID: #{per.id}, Age: #{per.age} " }
      when 3
        student_or_teacher
      when 4
        create_book
      when 5
        create_rent
      when 6
        list_rentals
      else
        puts 'Thank you for using this app.'
        break
      end
    end
  end
end
