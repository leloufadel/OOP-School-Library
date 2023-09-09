require_relative 'person'
class Student < Person
  attr_accessor :classroom
  attr_writer :parent_permission

  def initialize(age, name = 'Unknown')
    super(age, name)
  end

  def assign_classroom(classroom)
    self.classroom = classroom
    classroom&.add_student(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def to_s
    "Student: #{@name}, Age: #{@age}, Parent Permission: #{@parent_permission} ID:#{@id}"
  end
end
