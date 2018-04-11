class Book

  def initialize(attributes)
    @attributes = attributes
  end

  def author_first_name
    @attributes[:author_first_name]
  end

  def author_last_name
    @attributes[:author_last_name]
  end

  def title
    @attributes[:title]
  end

  def publication_date
    @attributes[:publication_date]
  end
end
