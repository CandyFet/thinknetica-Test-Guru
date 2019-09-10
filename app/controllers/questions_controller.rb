# frozen_string_literal: true

class QuestionsController < ApplicationController

  before_action :find_question, only: %i[update show edit]
  before_action :find_test, only: %i[index new create]

  def index
    @questions = @test.questions
  end

  def edit
    @test = @question.test
  end

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
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to test_questions_path(@question.test)
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
