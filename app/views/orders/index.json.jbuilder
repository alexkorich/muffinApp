json.array!(@orders) do |order|
  json.extract! order, :id, :date, :dish_id, :user_id, :menu_id
  json.url order_url(order, format: :json)
end
