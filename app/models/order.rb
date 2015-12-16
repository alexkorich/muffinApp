class Order < ActiveRecord::Base
  
  validates :user, :date, presence:true
  # validates :date, uniqueness:true
  validate :has_items?
  belongs_to :user

  belongs_to :drink
  belongs_to :first_course_dish
  belongs_to :second_course_dish
  
  # ==   if user will be able to order >1 dishes and drink remove drink_id, first_course_id and second_course_id
  # from schema and use this: ==

  # has_and_belongs_to_many :drink, association_foreign_key: 'dish_id', join_table: 'dishes_orders', :limit => 1
  # has_and_belongs_to_many :first_course_dish, association_foreign_key: 'dish_id', join_table: 'dishes_orders', :limit => 1
  # has_and_belongs_to_many :second_course_dish, association_foreign_key: 'dish_id', join_table: 'dishes_orders', :limit => 1

  def has_items?
    if (self.drink.blank? && self.first_course_dish.blank? && self.second_course_dish.blank?)
      errors.add(:base, "You need at least one item in order!") 
    else
      true
    end
  end

  def total_price
    a=0
    a+=self.drink.price if self.drink
    a+=self.first_course_dish.price if self.first_course_dish
    a+=self.second_course_dish.price if self.second_course_dish
    a.round(2)
  end
    def total_price_s
      "$ "+self.total_price.to_s
    end
end
