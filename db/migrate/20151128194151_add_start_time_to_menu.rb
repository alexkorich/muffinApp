class AddStartTimeToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :start_time, :datetime
  end
end
