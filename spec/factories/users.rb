require 'faker'

FactoryGirl.define do
  
  factory :user do
    username              {Faker::Internet.user_name}
    email                 {Faker::Internet.email}
    password              "Password"
    password_confirmation "Password"
  end  
  
end