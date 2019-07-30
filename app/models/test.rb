class Test < ApplicationRecord
  def self.names_by_category(category_title)
    self.select("title").joins("INNER JOIN categories ON categories.id = tests.category_id").where("categories.title = :category_title", category_title: category_title)
  end
end
