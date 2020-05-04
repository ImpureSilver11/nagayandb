# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    a = {}
    render json: a
  end
end
