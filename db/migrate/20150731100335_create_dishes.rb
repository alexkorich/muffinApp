class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.text :description
      t.string :quantity_description
      t.integer :quantity
      t.float :price
      t.integer :menu_id
      t.integer :order_id
      t.string :type

      t.timestamps null: false
    end
  end
end
