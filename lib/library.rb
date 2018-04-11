require './lib/book'
class Library < Book
  attr_reader :books
  def initialize
    @books = []
  end

  def add_to_collection(book)
    @books << book
  end

  def include?(title)
    @books.find do |book|
      book.title == title
    end
  end

  def card_catalogue
    @books.sort_by! do |book|
      book.author_last_name
    end
  end

  def find_by_author(author)
    first = author.split(' ')[0]
    last = author.split(' ')[1]
    collection = @books.group_by do |book|
      author if (book.author_first_name == first) &&
                (book.author_last_name == last)
    end
    delete_nil(collection)
  end

  def find_by_pulication_date(publication_date)
    collection = @books.group_by do |book|
      pb_date = book.publication_date.split(' ').last
      publication_date if pb_date == publication_date
    end
    delete_nil(collection)
  end

  def delete_nil(collection)
    collection.delete_if do |key, value|
      key == nil
    end
  end
end
