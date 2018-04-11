require './lib/book'
class Author < Book
  attr_accessor :books
  def initialize(attributes)
    @attributes = attributes
    @books      = []
  end

  def first_name
    @attributes[:first_name]
  end

  def last_name
    @attributes[:last_name]
  end

  def add_book(title, publication)
    @books << Book.new({
                        author_first_name: first_name,
                        author_last_name: last_name,
                        title: title,
                        publication_date: publication
                      })
  end
end
