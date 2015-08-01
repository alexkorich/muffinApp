class Menu < ActiveRecord::Base
  # delegate :drinks, :first_course_dishes, :second_course_dishes, to: :dishes
  
  has_many :drinks
  has_many :first_course_dishes
  has_many :second_course_dishes

  validates :drinks, :first_course_dishes, :second_course_dishes, :date, presence: true
  validates :date, uniqueness:true
end
