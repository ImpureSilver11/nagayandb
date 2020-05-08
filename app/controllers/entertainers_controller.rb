# frozen_string_literal: true

class EntertainersController < ApplicationController
  def show
    @entertainer = Entertainer.find(params.permit(:id)[:id])
    render json: @entertainer
  end

  def index
    @entertainers = Entertainer.all
    render json: @entertainers
  end
end
