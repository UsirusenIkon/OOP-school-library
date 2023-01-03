require_relative 'person'

class Student < Person
  def initialize(name, age, classroom = 'unknown', parent_permision: true)
    super(name, age, parent_permision: parent_permision)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
