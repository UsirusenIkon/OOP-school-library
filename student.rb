require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name, parent_permision)
    super(age, name, parent_permision: parent_permision)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
