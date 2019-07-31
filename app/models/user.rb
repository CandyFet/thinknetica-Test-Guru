class User < ApplicationRecord
  def tests_by_level(level)
    Test.select('title').joins("INNER JOIN user_tests ON user_tests.test_id = tests.id").where(tests: {level: level})
  end
end
