require './person'

class teacher < Person
  def initialize(specialization, id, age, name = 'Unknown', parent_permission = true)
    super(id, age, name, parent_permission)
    @specialization = specialization
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
