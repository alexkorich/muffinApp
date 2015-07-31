class Order < ActiveRecord::Base
 
  validate :has_items?
  belongs_to :user
  belongs_to :menu

  
  delegate :drinks, :first_course_dishes, :second_course_dishes, to: :dishes
  has_one :drink
  has_one :first_course_dish
  has_one :second_course_dish
  def has_items?
    if (self.drink.blank? && self.first_course_dish.blank? && self.second_course_dish.blank?)
      errors.add(:base, "You need at least one item in order!") 
    end
  end
end
