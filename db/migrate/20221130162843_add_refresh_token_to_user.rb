class AddRefreshTokenToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :refresh_token, :string
  end
end
