# frozen_string_literal: true

class TestsController < ApplicationController

  before_action :find_test

  def index
    render plain: Test.pluck(:title).join("\n")
  end

  def show
    render inline: '<%= @test.title %>'
  end
end
