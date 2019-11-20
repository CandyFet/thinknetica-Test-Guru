# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  has_many :questions, dependent: :destroy

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates_uniqueness_of :title, scope: :level

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :names_by_category, ->(category) { order(title: :desc).joins(:category).where(categories: { title: category }) }
  scope :by_level, ->(level) { where(tests: { level: level }) }

  def self.test_names_by_category(category)
    names_by_category(category).pluck(:title)
  end

end
