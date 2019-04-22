class CreateUserCompetitions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_competitions do |t|
      t.integer :user_id
      t.integer :competition_id
      t.integer :status
      t.integer :points

      t.timestamps
    end
  end
end
