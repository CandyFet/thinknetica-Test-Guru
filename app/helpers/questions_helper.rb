# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    if question.persisted?
      edit_header(question)
    elsif question.new_record?
      new_header
    end
  end

  private

  def edit_header(question)
    "Edit #{question.test.title} question"
  end

  def new_header
    'Create new question'
  end
end
