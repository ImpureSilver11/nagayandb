require 'json'

Pokemon.destroy_all

File.open("./db/seeds/pokemon_data.json") do |j|
  hash = JSON.load(j)
  hash['data'].each do |d|
    pokemon = Pokemon.create(
      no: d["no"],
      name: d["name"],
      form: d["form"],
      is_mega_evolution: d["isMegaEvolution"],
      evolutions: d["evolutions"],
      types: d["types"],
      abilities: d["abilities"],
      hidden_abilities: d["hiddenAbilities"]
    )
    PokemonStat.create(
      hp: d['stats']['hp'],
      attack: d['stats']['attack'],
      defence: d['stats']['defence'],
      sp_attack: d['stats']['spAttack'],
      sp_defence: d['stats']['spDefence'],
      speed: d['stats']['speed'],
      pokemon: pokemon
    )
  end
end
