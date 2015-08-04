class Order < ActiveRecord::Base
  # has_and_belongs_to_many :dishes
 
  validate :has_items?
  belongs_to :user

  
  # # delegate :drinks, :first_course_dishes, :second_course_dishes, to: :dishes
  # has_one :drink, through: :dishes_orders
  # has_one :first_course_dish
  # has_one :second_course_dish
  def has_items?
    if (self.drink.blank? && self.first_course_dish.blank? && self.second_course_dish.blank?)
      errors.add(:base, "You need at least one item in order!") 
    end
  end

  def total_price
    self.drink.price+self.first_course_dish.price+self.second_course_dish.price
  end
end
