class CreateCategoryAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :category_answers do |t|
      t.integer :category_id
      t.integer :answer_id

      t.timestamps
    end
  end
end
