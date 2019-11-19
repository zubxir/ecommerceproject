class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :password
      t.string :address
      t.string :postalcode
      t.string :city
      t.string :province
      t.string :email

      t.timestamps
    end
  end
end
