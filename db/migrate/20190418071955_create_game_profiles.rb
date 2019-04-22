class CreateGameProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :game_profiles do |t|
      t.integer :points
      t.integer :money
      t.integer :level

      t.timestamps
    end
  end
end
