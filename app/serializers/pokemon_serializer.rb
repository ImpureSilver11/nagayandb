class PokemonSerializer < ActiveModel::Serializer
  attributes :no # integer 図鑑No
  attributes :name # string 名前
  attributes :form # string フォーム
  attributes :is_mega_evolution # boolean メガ進化可否
  attributes :evolutions # integer 進化先図鑑No
  attributes :types # string タイプ
  attributes :abilities # string 特性
  attributes :hidden_abilities # string 夢特性隠れ特性
  has_one :pokemon_stat, serializer: PokemonStatSerializer
end
