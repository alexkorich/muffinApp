class RemoveSecondCourseIdFromMenu < ActiveRecord::Migration
  def change
    remove_column :menus, :second_course_id, :integer
  end
end
