class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.boolean :done
      t.float :time_taken
    end
  end
end
