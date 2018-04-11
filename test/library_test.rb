require './test/test_helper'
require './lib/library'
require './lib/Author'

class LibraryTest < Minitest::Test
  def setup
    @dpl = Library.new

    @charlotte_bronte = Author.new({first_name: 'Charlotte',
                                    last_name:  'Bronte'})
    @charlotte_bronte.add_book('Jane Eyre',
                               'October 16, 1847')
    @jane_eyre = @charlotte_bronte.books[0]
    @charlotte_bronte.add_book('Villette',
                               '1853')
    @villette = @charlotte_bronte.books[1]

    @harper_lee  = Author.new({first_name: 'Harper',
                               last_name:  'Lee'})
    @harper_lee.add_book('To Kill a Mockingbird',
                         'July 11, 1960')
    @mockingbird = @harper_lee.books[0]
  end

  def test_it_exists
    assert_instance_of Library, @dpl
  end

  def test_it_starts_empty
    assert_equal [], @dpl.books
  end

  def test_it_can_add_a_book
    assert_equal [], @dpl.books
    @dpl.add_to_collection(@jane_eyre)
    assert_instance_of Book, @dpl.books[0]
    assert_equal 'Jane Eyre', @dpl.books[0].title
  end

  def test_it_can_add_multiple_books
    assert_equal [], @dpl.books
    @dpl.add_to_collection(@jane_eyre)
    assert_instance_of Book, @dpl.books[0]
    assert_equal 'Jane Eyre', @dpl.books[0].title

    @dpl.add_to_collection(@villette)
    assert_instance_of Book, @dpl.books[1]
    assert_equal 'Villette', @dpl.books[1].title

    @dpl.add_to_collection(@mockingbird)
    assert_instance_of Book, @dpl.books[2]
    assert_equal 'To Kill a Mockingbird', @dpl.books[2].title
  end

  def test_library_inludes_books_in_collection
    @dpl.add_to_collection(@jane_eyre)
    @dpl.add_to_collection(@villette)
    @dpl.add_to_collection(@mockingbird)

    assert @dpl.include?('To Kill a Mockingbird')
    refute @dpl.include?("A Connecticut Yankee in King Arthur's Court")
  end

  def test_it_has_a_card_catalogue
    @dpl.add_to_collection(@jane_eyre)
    @dpl.add_to_collection(@villette)
    @dpl.add_to_collection(@mockingbird)

    assert_equal 'Bronte', @dpl.card_catalogue[0].author_last_name
    assert_equal 'Bronte', @dpl.card_catalogue[1].author_last_name
    assert_equal 'Lee', @dpl.card_catalogue[2].author_last_name
  end

  def test_find_by_author
    @dpl.add_to_collection(@jane_eyre)
    @dpl.add_to_collection(@villette)
    @dpl.add_to_collection(@mockingbird)

    title1 = @dpl.find_by_author('Charlotte Bronte')['Charlotte Bronte'][0].title
    title2 = @dpl.find_by_author('Charlotte Bronte')['Charlotte Bronte'][1].title
    assert_equal 'Jane Eyre', title1
    assert_equal 'Villette', title2
  end

  def test_find_by_pulication_date
    @dpl.add_to_collection(@jane_eyre)
    @dpl.add_to_collection(@villette)
    @dpl.add_to_collection(@mockingbird)

    title1 = @dpl.find_by_pulication_date('1960')['1960'][0].title
    title2 = @dpl.find_by_pulication_date('1982')['1982']
    assert_equal 'To Kill a Mockingbird', title1
    assert_nil title2
  end
end
