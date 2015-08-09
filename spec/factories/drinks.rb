FactoryGirl.define do
  factory :drink, class: Drink, parent: :dish do
    type "Drink"
  end
end