class DeleteColumnsFromAnswers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :answers, :answer_question_id
  	remove_column :answers, :category_answer_id
  end
end
