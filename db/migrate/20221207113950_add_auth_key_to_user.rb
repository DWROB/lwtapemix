class AddAuthKeyToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :auth_key, :text
  end
end
