class AddDishIdToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :dish_id, :integer
  end
end
