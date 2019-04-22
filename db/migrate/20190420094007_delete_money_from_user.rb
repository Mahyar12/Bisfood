class DeleteMoneyFromUser < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :money
  end
end
