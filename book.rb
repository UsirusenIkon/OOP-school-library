class Book
  attr_accessor :title, :author, :rentals

  def intialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
    rentals.book = self
  end
end
