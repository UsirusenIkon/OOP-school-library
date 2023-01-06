class Book
  attr_accessor :title, :author

  def intialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.book = self
  end
end
