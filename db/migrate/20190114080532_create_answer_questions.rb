class CreateAnswerQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_questions do |t|
      t.integer :question_id
      t.integer :answer_id

      t.timestamps
    end
  end
end
