require './nameable'
attr_accessor :name, :age

attr_reader :id

class Person < nameable
  def initialize(_id, age, name = 'Unknown', parent_permission = 'true')
    super()
    @id = Random.rand(1..1000)
    @name = name
    @parent_permission = parent_permission
    @age = age
  end

  def correct_name
    @name = name
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end
end
