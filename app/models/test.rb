# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  has_many :questions, dependent: :destroy
  has_many :test_users, dependent: :destroy
  has_many :users, through: :test_users

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validate :validates_uniqueness_of_attributes, :title, :level

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :names_by_category, ->(category) { order(title: :desc).joins(:category).where(categories: { title: category }).pluck(:title) }
  scope :by_level, ->(level) { where(tests: { level: level }) }

  private

  def validates_uniqueness_of_attributes(*attrs)
    attrs.each { |attr| validates attr, uniqueness: true }
  end
end
