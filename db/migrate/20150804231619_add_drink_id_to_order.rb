class AddDrinkIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :drink_id, :integer
  end
end
