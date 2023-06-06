class AddUserToCameras < ActiveRecord::Migration[7.0]
  def change
    add_reference :cameras, :user, null: false, foreign_key: true
  end
end
