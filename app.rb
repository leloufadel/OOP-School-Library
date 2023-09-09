require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
class App
  attr_accessor :all_books, :all_people, :all_rentals

  def initialize
    @all_books = []
    @all_people = []
    @all_rentals = []
  end

  def books
    @all_books.each_with_index do |book, index|
      puts "#{index}) #{book}"
    end
  end

  def people
    @all_people.each_with_index do |person, index|
      puts "#{index}) #{person}"
    end
  end

  def add_student
    puts 'Age: '
    age = gets.chomp
    puts 'Name: '
    name = gets.chomp
    puts 'Has parent persmission[Y/N]: '
    parent_perm = gets.chomp.upcase
    persmission = (parent_perm == 'Y')
    new_student = Student.new(age, name)
    new_student.parent_permission = persmission
    @all_people << new_student
    puts 'Student Created Successfully'
  end

  def add_teacher
    puts 'Age: '
    age = gets.chomp
    puts 'Name: '
    teacher_name = gets.chomp
    puts 'Specialization: '
    specialization = gets.chomp
    new_teacher = Teacher.new(age, teacher_name)
    new_teacher.specialization = specialization
    @all_people << new_teacher
    puts 'Teacher Created Successfully'
  end

  def add_person
    puts 'Do you want to create a Student(1) or a Teacher(2)? [Input the number]: '
    num = gets.chomp.to_i
    case num
    when 1
      add_student
    when 2
      add_teacher
    else
      puts 'Your input is an Invalid choice'
    end
  end

  def add_book
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @all_books << new_book
    puts 'Book Created Successfully'
  end

  def add_rental
    puts 'Select a book  from the following list by number'
    books
    book_num = gets.chomp.to_i
    puts 'Select a person from the list by number (not ID)'
    people
    person_num = gets.chomp.to_i
    puts 'Date: '
    date = gets.chomp
    new_rental = Rental.new(date, @all_books[book_num], @all_people[person_num])
    @all_rentals << new_rental
    puts 'Rental Added Successfully'
  end

  def all_personal_rentals(id)
    person_rental = @all_rentals.select do |rental|
      rental.person.id == id
    end
    puts person_rental
  end
end
