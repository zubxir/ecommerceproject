# frozen_string_literal: true

class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :postalcode, :string
    add_column :users, :city, :string
    add_column :users, :province, :string
  end
end
