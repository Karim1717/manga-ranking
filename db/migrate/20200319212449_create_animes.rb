class CreateAnimes < ActiveRecord::Migration[6.0]
  def change
    create_table :animes do |t|
      t.text :title
      t.text :synopsis

      t.timestamps
    end
  end
end
