class AddUserIdToGameProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :game_profiles, :user_id, :integer
  end
end
