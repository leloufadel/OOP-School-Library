require "./person.rb"

class Student < Person
  def initialize(classroom, id, age, name = "Unknown", parent_permission = true)
    super(id, age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    return "¯\\(ツ)/¯"  
  end
end
