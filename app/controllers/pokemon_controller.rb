class PokemonController < ApplicationController
  def show
    @pokemon = Pokemon.find(show_params[:id])
    render json: @pokemon
  end

  def index
    @pokemon = Pokemon.all
    render json: @pokemon
  end

  private

  def show_params
    params.permit(:id)
  end
end
