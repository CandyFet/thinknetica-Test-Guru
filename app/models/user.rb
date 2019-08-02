# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_users
  has_many :tests, through: :test_users

  def tests_by_level(level)
    tests.where(tests: { level: level })
  end
end
