require 'faker'

FactoryGirl.define do
  factory :category do
    name { Faker::Company.name }
  end
end