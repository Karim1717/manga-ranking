class RenameImageOnAnimes < ActiveRecord::Migration[6.0]
  def change
    rename_column :animes, :images, :image
  end
end
