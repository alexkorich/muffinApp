class Menu < ActiveRecord::Base
  # has_and_belongs_to_many :dishes
  has_and_belongs_to_many :first_course_dishes, association_foreign_key: 'dish_id', join_table: 'dishes_menus'
  has_and_belongs_to_many :second_course_dishes, association_foreign_key: 'dish_id', join_table: 'dishes_menus'
  has_and_belongs_to_many :drinks, association_foreign_key: 'dish_id', join_table: 'dishes_menus'

  # delegate :drinks, :first_course_dishes, :second_course_dishes, to: :dishes
  # attr_accessible :name, :dish_ids
  # has_many :drinks
  # has_many :first_course_dishes
  # has_many :second_course_dishes

  validates :drinks, :first_course_dishes, :second_course_dishes, :date, presence: true
  validates :date, uniqueness:true
end
