require "faker"

FactoryGirl.define do
  factory :institute do
     university {Faker::Educator.university}
     campus {Faker::Educator.campus}
     after(:create) do |ins|
       create_list(:qualification, 1, resource: ins)
     end
  end
end
