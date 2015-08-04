class CreateDishesOrders < ActiveRecord::Migration
  def change
    create_table :dishes_orders, :id => false do |t|
      t.references :dish, :order
    end

    add_index :dishes_orders, [:dish_id, :order_id],
      name: "dishes_orders_index",
      unique: true
  end
end
