class AddMoreDetailsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :spotify_name, :string
    add_column :users, :client_secret, :string
    add_column :users, :client_id, :string
    add_column :users, :spotify_access_token, :string
  end
end
