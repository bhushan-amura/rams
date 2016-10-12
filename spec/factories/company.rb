require "faker"

FactoryGirl.define do
  factory :company do
     name {Faker::Company.name}
     company_type {Faker::Company.suffix}
     url {Faker::Internet.url}
     tagline {Faker::Company.catch_phrase}
     phone {Faker::PhoneNumber.phone_number}
     number_of_employees {rand(100)}
     description {Faker::Lorem.paragraph(2)}
     logo {Faker::Company.logo}
     association :user, factory: :user, strategy: :build
  end

  factory :invalid_company, parent: :company do
    name {nil}
  end
  
end