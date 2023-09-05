attr_accessor :name, :age
attr_reader :id

class Person
  def initialize(_id, age, name = 'Unknown', parent_permission = 'true')
    @id = Random.rand(1..1000)
    @name = name
    @parent_permission = parent_permission
    @age = age
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
