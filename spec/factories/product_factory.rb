require 'faker'

FactoryGirl.define do
  factory :product do
    name { Faker::Commerce.product_name }
    price { Faker::Commerce.price }
    quantity { rand(21) }
    category { FactoryGirl.build(:category) }
  end

end