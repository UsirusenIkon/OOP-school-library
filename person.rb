require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rental

  def initialize(name, age = 'unknown', parent_permision: true)
    super()
    @name = name
    @age = age
    @parent = parent_permision
    @rental = []
  end

  def add_rental(rental)
    @rental.push(rental)
  end

  def can_use_services?
    of_age || @parent
  end

  def correct_name
    name
  end

  private

  def of_age?
    of_age >= 18
  end
end
