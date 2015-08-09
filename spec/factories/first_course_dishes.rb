FactoryGirl.define do
  factory :first_course_dish, class: FirstCourseDish, parent: :dish do
    type "FirstCourseDish"
  end
end