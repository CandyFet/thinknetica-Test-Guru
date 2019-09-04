# frozen_string_literal: true

class QuestionsController < ApplicationController

  before_action :find_test

  def index
    render plain: @test.questions.pluck(:body).join("\n")
  end

  def show
    question = Question.find_by_id(params[:id])
    render plain: question.body
  end

  def new
    @question = Question.new
  end

  def create
    byebug
    @question = @test.questions.create(question_params)
    render 'new' unless @question.errors.empty?
  end

  def destroy
    question = Question.find_by_id(params[:id])
    question.delete
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body).require(:body)

  end

end
