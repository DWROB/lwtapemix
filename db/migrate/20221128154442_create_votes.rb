class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.references :playlist
      t.references :song
      t.integer :votes

      t.timestamps
    end
  end
end
