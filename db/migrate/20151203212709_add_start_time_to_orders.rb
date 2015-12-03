class AddStartTimeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :start_time, :datetime
  end
end
