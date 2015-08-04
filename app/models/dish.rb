class Dish < ActiveRecord::Base
  
  has_and_belongs_to_many :menus, association_foreign_key: 'menu_id', join_table: 'dishes_menus'


  # ==   if user will be able to order >1 dishes and drink use this: ==
  # has_and_belongs_to_many :orders, association_foreign_key: 'order_id', join_table: 'dishes_orders'  

  has_many :orders
  validates :name, :price, :quantity, presence: true
  scope :first_course_dishes, -> { where(type: 'FirstCourseDish') } 
  scope :drinks, -> { where(type: 'Drink') } 
  scope :second_course_dishes, -> { where(type: 'SecondCourseDish') }
end
