class CreateCompetitions < ActiveRecord::Migration[5.2]
  def change
    create_table :competitions do |t|
      t.integer :status
      t.integer :winner

      t.timestamps
    end
  end
end
