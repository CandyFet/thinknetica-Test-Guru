# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_users, dependent: :destroy
  has_many :tests, through: :test_users
  has_many :creators, class_name: 'Test', foreign_key: :creator_id

  def tests_by_level(level)
    tests.where(tests: { level: level })
  end
end
