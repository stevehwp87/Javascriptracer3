class CreatePlayerGames < ActiveRecord::Migration
  def change
    create_table :player_games do |t|
      t.integer :player_id
      t.integer :game_id
      t.integer :player_number
      t.boolean :winner
      t.integer :final_index

      t.timestamps
    end
    add_index :player_games, [:player_id, :game_id]
  end
end
