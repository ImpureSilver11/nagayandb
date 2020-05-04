# frozen_string_literal: true

class CreateEntertainers < ActiveRecord::Migration[6.0]
  def change
    create_table :entertainers do |t|
      t.string 'name'
      t.timestamps
    end
  end
end
