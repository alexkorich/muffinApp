json.array!(@orders.where(date: Date.today)) do |order|
  json.extract! order, :id, :date, :user_id, :total_price
  
end
