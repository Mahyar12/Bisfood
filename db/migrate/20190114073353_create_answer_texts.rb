class CreateAnswerTexts < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_texts do |t|
      t.string :atext

      t.timestamps
    end
  end
end
