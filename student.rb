require './person'

class Student < Person
  attr_reader :classroom 
  def initialize(classroom, id, age, name: 'Unknown', parent_permission: true)
    super(id, age, name, parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.includes?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
