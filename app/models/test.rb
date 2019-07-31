class Test < ApplicationRecord
  def self.names_by_category(category_title)
    titles = []
    order(title: :desc).joins("INNER JOIN categories ON categories.id = tests.category_id").where(categories: { title: category_title }).each do |test|
      titles << test.title
    end
    titles
  end
end
