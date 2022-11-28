class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.references :playlist
      t.string :name
      t.string :image
      t.string :spotify_id
      t.string :artist

      t.timestamps
    end
  end
end
