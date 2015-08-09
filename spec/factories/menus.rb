FactoryGirl.define do
 
  factory :menu do
    date    Date.today
    before(:create) {




      |menu| menu.first_course_dishes = [build(:first_course_dish, name:(1..10).to_a.shuffle)]
 menu.second_course_dishes = [build(:second_course_dish, name: (1..10).to_a.shuffle)]
 menu.drinks = [build(:drink, name:(1..10).to_a.shuffle)]
    }
  end
end