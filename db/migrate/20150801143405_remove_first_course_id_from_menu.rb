class RemoveFirstCourseIdFromMenu < ActiveRecord::Migration
  def change
    remove_column :menus, :first_course_id, :integer
  end
end
