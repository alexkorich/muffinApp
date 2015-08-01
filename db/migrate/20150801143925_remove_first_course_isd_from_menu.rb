class RemoveFirstCourseIsdFromMenu < ActiveRecord::Migration
  def change
    remove_column :menus, :first_course_dish_id, :integer
  end
end
