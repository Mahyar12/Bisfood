class CreateCurrencyPacks < ActiveRecord::Migration[5.2]
  def change
    create_table :currency_packs do |t|
      t.string :name
      t.integer :price
      t.integer :amount
      t.integer :discount

      t.timestamps
    end
  end
end
