class AddColumnsToCameras < ActiveRecord::Migration[7.0]
  def change
    add_column :cameras, :price, :integer
    add_column :cameras, :condition, :string
  end
end
