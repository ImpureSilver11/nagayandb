class PokemonSearchService < BaseService
  def run!
    result = Pokemon.includes(:pokemon_stat)
    result = result.where(no: params[:id]) if params[:id]
    result = result.where('name LIKE ?', "%#{params[:name]}%") if params[:name]
    result = result.where('form LIKE ?', "%#{params[:form]}%") if params[:form]
    result = result.where(is_mega_evolution: params[:is_mega_evolution]) unless params[:is_mega_evolution].nil?
    result = result.where('evolutions  @> ARRAY[?]::varchar[]?', [params[:evolutions]]) if params[:evolutions]
    result = result.where('types  @> ARRAY[?]::varchar[]?', [params[:types]]) if params[:types] # enumから選択　
    result = result.where('abilities @> ARRAY[?]::varchar[]', [params[:abilities]]) if params[:abilities] # enumから選択
    if params[:hidden_abilities]
      result = result.where('hidden_abilities  @> ARRAY[?]::varchar[]', [params[:hidden_abilities]])
    end
    result = result.where(pokemon_stats: { hp: params[:hp] }) if params[:hp]
    result = result.where(pokemon_stats: { attack: params[:attack] }) if params[:attack]
    result = result.where(pokemon_stats: { defence: params[:defence] }) if params[:defence]
    result = result.where(pokemon_stats: { sp_attack: params[:sp_attack] }) if params[:sp_attack]
    result = result.where(pokemon_stats: { sp_defence: params[:sp_defence] }) if params[:sp_defence]
    result = result.where(pokemon_stats: { speed: params[:speed] }) if params[:speed]
    result
  end
end
