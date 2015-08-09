FactoryGirl.define do
 
  factory :dish do
    name     Faker::Lorem.word 
    price    Faker::Commerce.price
    quantity Faker::Number.number(2)
  end
end