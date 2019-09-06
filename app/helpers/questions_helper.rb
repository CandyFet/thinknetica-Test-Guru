# frozen_string_literal: true

module QuestionsHelper
  ACTION_HEADERS = { 'new' => 'Create new', 'edit' => 'Edit'}.freeze

  def question_header(test, action)
    "#{ACTION_HEADERS[action]} #{test.title} question"
  end
end
