class AddAnswerCorrectToAnswerQuestions < ActiveRecord::Migration[5.2]
  def change
  	add_column :answer_questions, :correct, :integer
  end
end
