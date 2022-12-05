class AddDefaultValueToVotes < ActiveRecord::Migration[7.0]
  def change
    change_column_default :votes, :votes, 1
  end
end
