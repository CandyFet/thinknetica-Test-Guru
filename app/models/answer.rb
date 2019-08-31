class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validates_amount_of_questions, on: :create

  scope :correct, -> { where(correct: true) }


  private

  def validates_amount_of_questions
    errors.add(:body) if question.answers.count >= 4
  end

end
