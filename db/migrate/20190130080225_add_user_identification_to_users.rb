class AddUserIdentificationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_identification, :string
  end
end
