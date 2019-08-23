class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :test_users, dependent: :destroy
  has_many :users, through: :test_users

  def self.names_by_category(category_title)
    order(title: :desc).joins(:category).where(categories: { title: category_title }).pluck(:title)
  end
end
