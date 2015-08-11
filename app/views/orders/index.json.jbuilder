json.array!(@orders) do |order|
  json.extract! order, :id, :date, :user_id, :total_price
  
end
