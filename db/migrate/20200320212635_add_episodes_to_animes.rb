class AddEpisodesToAnimes < ActiveRecord::Migration[6.0]
  def change
    add_column :animes, :episodes, :string
  end
end
