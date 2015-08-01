class RemoveOrderIdFromMenu < ActiveRecord::Migration
  def change
    remove_column :menus, :order_id, :integer
  end
end
