class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end
end
