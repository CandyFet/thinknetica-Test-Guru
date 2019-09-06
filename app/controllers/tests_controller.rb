# frozen_string_literal: true

class TestsController < ApplicationController

  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    render plain: Test.pluck(:title).join("\n")
  end

  def show
    @questions = @test.questions
  end

  private

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
