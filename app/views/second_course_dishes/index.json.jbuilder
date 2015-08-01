json.array!(@second_course_dishes) do |second_course_dish|
  json.extract! second_course_dish, :id
  json.url second_course_dish_url(second_course_dish, format: :json)
end
