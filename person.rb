require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'rental'

class Person < Nameable
  attr_accessor :name, :age, :rentals, :parent_permision, :id

  def initialize(age, name = 'unknown', parent_permision: true)
    super()
    @id = rand(1...1000)
    @age = age
    @name = name
    @parent = parent_permision
    @rentals = []
  end

   def add_rental(book, date)
    Rental.new(date, book, self)
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
