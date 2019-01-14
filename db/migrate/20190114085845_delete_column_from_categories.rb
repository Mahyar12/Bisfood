class DeleteColumnFromCategories < ActiveRecord::Migration[5.1]
  def change
  	remove_column :categories, :category_question_id
  	remove_column :categories, :category_answer_id
  end
end
