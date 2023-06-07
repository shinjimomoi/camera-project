class AddPhotoToCameras < ActiveRecord::Migration[7.0]
  def change
    add_column :cameras, :photo, :string
  end
end
