class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :answer_question_id
      t.integer :category_answer_id
      t.string :answer_type
      t.integer :answer_type_id

      t.timestamps
    end
  end
end
