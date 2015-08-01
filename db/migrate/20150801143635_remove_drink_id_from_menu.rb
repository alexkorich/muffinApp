class RemoveDrinkIdFromMenu < ActiveRecord::Migration
  def change
    remove_column :menus, :drink_id, :integer
  end
end
