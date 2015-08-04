class AddSecondCourseDishIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :second_course_dish_id, :integer
  end
end
