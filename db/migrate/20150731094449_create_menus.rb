class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.date :date
      t.integer :first_course_dish_id
      t.integer :second_course_id
      t.integer :drink_id
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
