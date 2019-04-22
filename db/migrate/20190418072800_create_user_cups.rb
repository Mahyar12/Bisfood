class CreateUserCups < ActiveRecord::Migration[5.2]
  def change
    create_table :user_cups do |t|
      t.integer :user_id
      t.integer :cup_id
      t.integer :cup_count

      t.timestamps
    end
  end
end
