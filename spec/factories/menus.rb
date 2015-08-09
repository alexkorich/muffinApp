FactoryGirl.define do
 
  factory :menu do
    date    Date.today
    before(:create) {




      |menu| menu.first_course_dishes = [create(:first_course_dish, name:(1..10).to_a.shuffle)]
 menu.second_course_dishes = [create(:second_course_dish, name: (1..10).to_a.shuffle)]
 menu.drinks = [create(:drink, name:(1..10).to_a.shuffle)]
    }
  end
end