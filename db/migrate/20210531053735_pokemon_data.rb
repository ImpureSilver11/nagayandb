class PokemonData < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.integer    :no, null: false, comment: '図鑑No'
      t.string     :name,     null: false, comment: '名前'
      t.string     :form,     null: true, comment: 'フォーム'
      t.boolean    :is_mega_evolution, comment: 'メガ進化可否'
      t.integer    :evolutions, array: true, comment: '進化先図鑑No'
      t.string     :types, array: true, comment: 'タイプ'
      t.string     :abilities, array: true, comment: '特性'
      t.string     :hidden_abilities, array: true, comment: '夢特性隠れ特性'
    end
    create_table :pokemon_stats do |t|
      t.integer :hp, null: false, coment: 'HP'
      t.integer :attack, null: false, coment: '攻撃'
      t.integer :defence, null: false, coment: '防御'
      t.integer :sp_attack, null: false, coment: '特殊攻撃'
      t.integer :sp_defence, null: false, coment: '特殊防御'
      t.integer :speed, null: false, coment: '素早さ'
    end
    add_reference :pokemon_stats, :pokemon, index: true
  end
end
