require './test/test_helper'
require './lib/author'

class AuthorTest < Minitest::Test
  def setup
    @charlotte_bronte = Author.new({
                                    first_name: 'Charlotte',
                                    last_name: 'Bronte'
                                    })
  end

  def test_it_exists
    assert_instance_of Author, @charlotte_bronte
  end

  def test_book_list_starts_empty
    assert_equal [], @charlotte_bronte.books
  end

  def test_it_can_add_a_book
    @charlotte_bronte.add_book('Jane Eyre', 'October 16, 1847')
    assert_instance_of Book, @charlotte_bronte.books[0]
    assert_equal 'Jane Eyre', @charlotte_bronte.books[0].title
    @charlotte_bronte.add_book('Villette', '1853')
    assert_instance_of Book, @charlotte_bronte.books[1]
    assert_equal 'Villette', @charlotte_bronte.books[1].title
  end

end
