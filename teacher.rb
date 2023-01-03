require_relative 'person'

class Teacher < Person
  def initialize(name, age, specialization = 'Unknown', parent_permision: true)
    super(name, age, parent_permision: parent_permision)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
