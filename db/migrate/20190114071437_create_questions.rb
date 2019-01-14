class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :content
      t.integer :qtype_id
      t.integer :answer_question_id
      t.integer :category_question_id

      t.timestamps
    end
  end
end
