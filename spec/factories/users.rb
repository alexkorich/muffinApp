FactoryGirl.define do
 
   factory :user do
    name     {Faker::Internet.user_name+(1..10).to_a.shuffle.to_s}
    email {Faker::Internet.email}
    password "12345678"
    password_confirmation "12345678"
 end
 

end