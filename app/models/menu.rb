class Menu < ActiveRecord::Base
 
  has_and_belongs_to_many :first_course_dishes, association_foreign_key: 'dish_id', join_table: 'dishes_menus'
  has_and_belongs_to_many :second_course_dishes, association_foreign_key: 'dish_id', join_table: 'dishes_menus'
  has_and_belongs_to_many :drinks, association_foreign_key: 'dish_id', join_table: 'dishes_menus'


  validates :drinks, :first_course_dishes, :second_course_dishes, :date, presence: true
  validates :date, uniqueness:true
end
