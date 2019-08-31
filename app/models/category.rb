class Category < ApplicationRecord
  default_scope { order(title: :desc) }

  has_many :tests, dependent: :nullify

  validates :title, presence: true

end
