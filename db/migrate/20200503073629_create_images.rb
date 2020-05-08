# frozen_string_literal: true

class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :path
      t.string :title
      t.integer :tags_id, array: true, null: false, default: []
      t.timestamps
      t.references :entertainer, index: true, foreign_key: true
    end
  end
end
