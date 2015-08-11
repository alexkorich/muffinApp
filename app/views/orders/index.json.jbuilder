json.orders @orders.where(date: Date.today) do |order|

  json.user do
    json.name order.user.name
    json.email order.user.email
  end

  json.order_id order.id
  json.date order.date

  json.first_course do
    json.name order.first_course_dish.name
    json.price order.first_course_dish.price
  end

  json.second_course do
    json.name order.second_course_dish.name
    json.price order.second_course_dish.price
  end

  json.drink do
    json.name order.drink.name
    json.price order.drink.price
  end

  json.total_price order.total_price

end
