# frozen_string_literal: true

module QuestionsHelper
  def question_header(question, test)
    if question.persisted?
      edit_header(question)
    elsif question.new_record?
      new_header(test)
    end
  end

  private

  def edit_header(question)
    "Edit #{question.test.title} question"
  end

  def new_header(test)
    "Create new #{test.title} question"
  end
end
