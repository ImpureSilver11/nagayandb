class PokemonController < ApplicationController
  def show
    render json: PokemonSearchService.new(show_params).run!, each_serializer: PokemonSerializer
  end

  def index
    render json: PokemonSearchService.new(show_params).run!, each_serializer: PokemonSerializer
  end

  private

  def show_params
    params.permit(
      :id,
      :name,
      :form,
      :is_mega_evolution,
      :evolutions,
      :types,
      :abilities,
      :hidden_abilities,
      :hp,
      :attack,
      :defence,
      :sp_attack,
      :sp_defence,
      :speed
    )
  end
end
