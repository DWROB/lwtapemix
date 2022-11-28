class CreatePlaylists < ActiveRecord::Migration[7.0]
  def change
    create_table :playlists do |t|
      t.string :name
      t.string :spotify_playlist_id
      t.references :user
      t.string :playlist_images

      t.timestamps
    end
  end
end
