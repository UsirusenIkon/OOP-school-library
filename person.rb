class Person
  def initialize(name, age = 'unknown', parent_permision: true)
    @name = name
    @age = age
    @parent = parent_permision
  end

  attr_accessor :@name, :@age

  att_reader :@id

  def can_use_services?
    of_age || parent_permision
  end

  private

  def of_age?
    of_age >= 18
  end
end
