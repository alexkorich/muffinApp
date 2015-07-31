class Order < ActiveRecord::Base
	 has_one :dish, :as => :first_course_dish
	 has_one :dish, :as => :second_course_dish
	 has_one :dish, :as => :drink
	 belongs_to :user

end
