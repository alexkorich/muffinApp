class Dish < ActiveRecord::Base
  validates :name, :price, :quantity, presence: true
	 belongs_to :order
	 belongs_to :menu

	scope :first_course_dishes, -> { where(type: 'FirstCourseDish') } 
	scope :drinks, -> { where(type: 'Drink') } 
	scope :second_course_dishes, -> { where(type: 'SecondCourseDish') }
end


