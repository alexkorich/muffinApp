class RemoveOrderIdFromDish < ActiveRecord::Migration
  def change
    remove_column :dishes, :order_id, :integer
  end
end
