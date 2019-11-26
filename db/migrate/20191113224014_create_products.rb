# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :productname
      t.string :description
      t.integer :price
      t.integer :quantity
      t.string :image
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
