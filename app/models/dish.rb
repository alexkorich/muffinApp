class Dish < ActiveRecord::Base
	 belongs_to :order
	 belongs_to :menu

	
end
class Drink < Dish
	belongs_to :order
	belongs_to :menu

end


class SecondCourseDish < Dish
	belongs_to :order
	belongs_to :menu

end