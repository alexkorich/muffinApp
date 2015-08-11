json.orders @orders.where(date: Date.today) do |order|
  json.order_id order.id
  json.date order.date
  json.first_course order.first_course_dish
  json.second_course order.second_course_dish
  json.drink order.drink
  json.total_price order.total_price
  json.user do
    json.name order.user.name
    json.email order.user.email
  end
end
