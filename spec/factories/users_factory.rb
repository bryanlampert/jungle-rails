require 'faker'

FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { |u| "#{first_name}_#{last_name}_#{Random.rand(1000).to_s}@factory.com" }
    password "password"
    password_confirmation "password"
  end

end
