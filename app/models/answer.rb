class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validates_amount_of_questions

  scope :correct, -> { where(correct: true) }


  private

  def validates_amount_of_questions
    errors.add(:body) unless question.answers.size.in?(1..4)
  end

end
