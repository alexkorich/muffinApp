class AddFirstCourseDishIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :first_course_dish_id, :integer
  end
end
