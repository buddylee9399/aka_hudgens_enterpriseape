class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.string :name
      t.string :category
      t.integer :quantity
      t.references :invoice, null: false, foreign_key: true
      t.decimal :price

      t.timestamps
    end
  end
end
