class AddPlaylistOwnertoPlaylists < ActiveRecord::Migration[7.0]
  def change
    add_column :playlists, :owner, :string
  end
end
