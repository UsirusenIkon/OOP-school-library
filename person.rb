require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(name, age = 'unknown', parent_permision: true)
    super()
    @name = name
    @age = age
    @parent = parent_permision
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
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
