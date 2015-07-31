json.array!(@orders) do |order|
  json.extract! order, :id, :date, :first_course_dish_id, :second_course_dish_id, :drink_id, :user_id, :menu_id
  json.url order_url(order, format: :json)
end
