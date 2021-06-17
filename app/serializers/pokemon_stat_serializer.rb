class PokemonStatSerializer < ActiveModel::Serializer
  attributes :hp
  attributes :attack
  attributes :defence
  attributes :sp_attack
  attributes :sp_defence
  attributes :speed
end
