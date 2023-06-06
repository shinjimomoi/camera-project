class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :country
      t.string :email, unique: true
      t.string :password
      t.timestamps
    end
  end
end
