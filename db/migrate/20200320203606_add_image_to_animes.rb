class AddImageToAnimes < ActiveRecord::Migration[6.0]
  def change
    add_column :animes, :images, :string
  end
end
