class CreateTableGames < ActiveRecord::Migration[5.1]
  def change
    create_table :table_games do |t|
      t.string :show_chars
      t.text :words

      t.timestamps
    end
  end
end
