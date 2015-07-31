class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :date
      t.integer :first_course_dish_id
      t.integer :second_course_dish_id
      t.integer :drink_id
      t.integer :user_id
      t.integer :menu_id

      t.timestamps null: false
    end
  end
end
