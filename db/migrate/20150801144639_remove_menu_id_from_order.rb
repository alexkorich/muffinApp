class RemoveMenuIdFromOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :menu_id, :integer
  end
end
