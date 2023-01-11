require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, name = 'unknown', parent_permision: true)
    super()
    @id = rand(1...1000)
    @age = age
    @name = name
    @parent = parent_permision
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.person = self
  end

  def can_use_services?
    of_age || @parent
  end

  def correct_name
    @name
  end

  private

  def of_age?
    of_age >= 18
  end
end
