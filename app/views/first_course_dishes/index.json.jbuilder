json.array!(@first_course_dishes) do |first_course_dish|
  json.extract! first_course_dish, :id
  json.url first_course_dish_url(first_course_dish, format: :json)
end
