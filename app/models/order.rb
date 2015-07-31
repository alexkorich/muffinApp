class Order < ActiveRecord::Base
  belongs_to :user
  has_many :dishes
  delegate :drinks, :first_course_dishes, :second_course_dishes, to: :dishes

end
