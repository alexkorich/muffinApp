class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :date
      t.integer :dish_id
      t.integer :user_id
      t.integer :menu_id

      t.timestamps null: false
    end
  end
end
