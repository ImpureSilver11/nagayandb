# frozen_string_literal: true

class EntertainersController < ApplicationController
  def show
    build_params = show_params(params)
    @entertainer = Entertainer.find(build_params[:id])
    render json: @entertainer
  end

  def index
    @entertainers = Entertainer.all
    render json: @entertainers
  end

  def create
    build_params = create_params(params)
    Entertainer.create!(name: build_params[:name])
  end

  private

  def show_params(params)
    params.permit(:id)
  end

  def create_params(params)
    params.permit(:name)
  end
end
