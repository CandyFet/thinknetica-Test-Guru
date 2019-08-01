# frozen_string_literal: true

class User < ApplicationRecord
  has_and_belongs_to_many :tests

  def tests_by_level(level)
    tests.where(tests: { level: level })
  end

  def create_test(title, category_title)
    category = if Category.find_by_title(category_title).nil?
                 Category.new(title: category_title).save!
               else
                 Category.find_by_title(category_title)
               end
    init_new_test(title, category)
  end

  private

  def init_new_test(title, category)
    Test.new(title: title, category_id: category.id, creator_id: id).save!
  end
end
