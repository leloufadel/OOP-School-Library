require_relative 'app'
def menu_list
  puts ''
  puts 'Welcome to School Library App!'
  puts ''
  puts 'Please choose an option by entering a number: '
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a renal'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def main
  my_app = App.new
  loop do
    menu_list
    choice = gets.chomp.to_i
    case choice
    when 1
      my_app.books
    when 2
      my_app.people
    when 3
      my_app.add_person
    when 4
      my_app.add_book
    when 5
      my_app.add_rental
    when 6
      puts 'Enter person ID'
      id = gets.chomp.to_i
      my_app.all_personal_rentals(id)
    when 7
      puts 'Thank you for using this app!'
      break
    else
      puts 'Your input is Invalid'
    end
  end
end
main if __FILE__ == $PROGRAM_NAME
