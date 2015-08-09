FactoryGirl.define do
 
  factory :order do
    date Date.today
    association :first_course_dish, strategy: :build
    association :second_course_dish, strategy: :build
    association :drink, strategy: :build
    association :user, strategy: :build
  end
end