class CreateUserAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_answers do |t|
      t.integer :question_id
      t.integer :user_id
      t.integer :competition_id
      t.integer :status

      t.timestamps
    end
  end
end
