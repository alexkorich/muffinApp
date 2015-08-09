FactoryGirl.define do
  factory :second_course_dish, class: SecondCourseDish, parent: :dish do
    type "SecondCourseDish"
  end
end