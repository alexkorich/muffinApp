class FirstCourseDish < Dish
	belongs_to :order, :class_name => "FirstCourseDish", :foreign_key => "dish_id"
	belongs_to :menu

end