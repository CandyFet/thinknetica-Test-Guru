class Test < ApplicationRecord
  has_many :test_users, dependent: :destroy
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :users, through: :test_users

  def self.names_by_category(category_title)

    Category.find_by_title!(category_title).tests.pluck(:title).reverse

  end
end
