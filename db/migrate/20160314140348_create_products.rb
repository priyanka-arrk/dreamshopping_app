class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :product_type
      t.string :brand
      t.float :price
      t.integer :warranty_in_months

      t.timestamps null: false
    end
  end
end
