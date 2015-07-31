json.array!(@menus) do |menu|
  json.extract! menu, :id, :date, :first_course_dish_id, :second_course_id, :drink_id, :order_id
  json.url menu_url(menu, format: :json)
end
