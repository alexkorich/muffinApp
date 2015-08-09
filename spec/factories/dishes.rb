FactoryGirl.define do
 
  factory :dish do
    name     Faker::Lorem.word+(1..50).to_a.shuffle.to_s
    price    Faker::Commerce.price
    quantity Faker::Number.number(2)
  end
end