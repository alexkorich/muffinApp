class RemoveDishIdFromMenu < ActiveRecord::Migration
  def change
    remove_column :menus, :dish_id, :integer
  end
end
