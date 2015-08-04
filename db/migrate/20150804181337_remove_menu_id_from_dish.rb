class RemoveMenuIdFromDish < ActiveRecord::Migration
  def change
    remove_column :dishes, :menu_id, :integer
  end
end
