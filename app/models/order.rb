class Order < ActiveRecord::Base
  belongs_to :user
  # has_one :dish, class_name: "Drink"
  has_many :dishes
  # has_one :dish, class_name: "SecondCourseDish"


end
