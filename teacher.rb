require './person'

class teacher < Person
  def initialize(classroom, id, age, name = 'Unknown', parent_permission = true)
    super(id, age, name, parent_permission)
    @classroom = classroom
  end

  def can_use_services?
    true
  end
end