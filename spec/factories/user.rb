require "faker"

FactoryGirl.define do
  factory :user do
    # name {Faker::Internet.user_name}
    email {Faker::Internet.email}
    password {Faker::Internet.password}
    password_confirmation {password}
    
  end
end
