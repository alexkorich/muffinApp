class CreateDishesMenus < ActiveRecord::Migration
  def change
    create_table :dishes_menus, :id => false do |t|
      t.references :dish, :menu
    end

    add_index :dishes_menus, [:dish_id, :menu_id],
      name: "dishes_menus_index",
      unique: true
  end
end
