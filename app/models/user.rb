# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_users, dependent: :destroy
  has_many :tests, through: :test_users
  has_many :created_tests, class_name: 'Test', foreign_key: :creator_id

  validates :email, presence: true

  def tests_by_level(level)
    tests.by_level(level)
  end
end
