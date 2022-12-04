class AddActiveColumnToPlaylists < ActiveRecord::Migration[7.0]
  def change
    add_column :playlists, :active, :boolean, default: false
  end
end
