class RemoveClientSecretFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :client_secret, :string
    remove_column :users, :client_id, :string
  end
end
