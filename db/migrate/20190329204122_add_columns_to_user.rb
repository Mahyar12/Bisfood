class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :device_id, :string
  	add_column :users, :age, :integer
  	add_column :users, :biography, :text
  	add_column :users, :city, :string
  	add_column :users, :money, :integer

  end
end
