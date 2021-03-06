# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_question, only: %i[update show edit destroy]
  before_action :find_test, only: %i[new create]

  def edit; end

  def show
    @test = @question.test
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.create(question_params)
    if @question.save
      redirect_to @test
    else
      render 'new'
    end
  end

  def destroy
    @question.destroy

    redirect_to @question.test
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
