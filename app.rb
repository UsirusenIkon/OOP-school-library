require_relative 'rental'
require_relative 'person'
require_relative 'classroom'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def start
    puts 'Welcome to the Library System!'
    list_of_options
  end

  def list_all_books
    if @books.length.positive?
      @books.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    else
      puts 'No books found'
    end
  end

  def list_all_people
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    person_type = gets.chomp
    case person_type
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'That is not a valid input'
      create_person
    end
  end

  def create_student
    student_attributes = student_values
    student = Student.new(nil, student_attributes[:age], student_attributes[:name],
                          student_attributes[:parent_permission])
    people << student
    puts 'Person(student) Created successfully'
  end

  def create_teacher
    teacher_attributes = teacher_values
    teacher = Teacher.new(teacher_attributes[:age],
                          teacher_attributes[:specialization],
                          teacher_attributes[:name])
    people << teacher
    puts 'Person(Teacher) created successfully'
  end

  def create_book()
    puts 'Create a new book'
    print 'Enter title: '
    title = gets.chomp
    print 'Enter author: '
    author = gets
    book = Book.new(title, author)
    @books.push(book)
    puts "Book #{title} created successfully."
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index} Title: #{book.title}, Author: #{book.author}"
    end
    puts 'Book number:'
    book_index = gets.chomp.to_i
    book = @books[book_index]
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index} [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    person = @people[person_index]
    puts 'Date:'
    date = gets.chomp
    @rentals << Rental.new(date, person, book)
    puts 'Rental created successfully!'
  end

  def list_rental_for_person
    puts 'ID of person:'
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.select { |rental| rental.person.id == id }.each do |rental|
      puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
    end
  end

  ##### method attributes

  private

  def student_values
    puts 'Age'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Has parent permission? [Y/N]'
    parent_permission = gets.chomp
    { age: age, name: name, parent_permission: parent_permission.downcase == 'y' }
  end

  def teacher_values
    puts 'Age:'
    age = gets.chomp
    puts 'Specialization:'
    specialization = gets.chomp
    puts 'Name:'
    name = gets.chomp
    { age: age, specialization: specialization, name: name }
  end
end
