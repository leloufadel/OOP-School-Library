class Teacher < Person
  attr_accessor :specialization

  def initialize(age, name = 'Unknown')
    super(age, name)
  end

  def can_use_services
    true
  end

  def to_s
    "Teacher:#{@name}, Age: #{@age}, Specialization: #{@specialization}, ID: #{@id}"
  end
end
