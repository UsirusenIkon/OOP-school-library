class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def intialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.book = self
  end
end
