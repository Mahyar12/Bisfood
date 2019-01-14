class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.integer :category_answer_id
      t.integer :category_question_id
      t.string :name

      t.timestamps
    end
  end
end
