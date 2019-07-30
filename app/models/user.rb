class User < ApplicationRecord
  def tests_by_level(level)
    Test.select('title').joins("INNER JOIN user_tests ON user_tests.test_id = tests.id").where("user_tests.user_id = :user_id AND tests.level = :level", user_id: self.id, level: level)
  end
end
