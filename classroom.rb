class classroom

  attr_accessor :label
  attr_reader :students

  def intialize(label)
    @label = label
    @Students = []
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end