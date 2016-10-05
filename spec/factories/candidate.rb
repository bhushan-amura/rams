require "faker"

FactoryGirl.define do
  factory :candidate do
     first_name {Faker::Name.first_name}
     last_name {Faker::Name.last_name}
     dob {Faker::Date.between(50.years.ago,20.years.ago)}
     gender {genders[rand(3)]}
     marital_status { marital_statuses[rand(2)]}
     status {statuses[rand(2)]}
     languages {Faker::Lorem.words.join(',')}
     summary {Faker::Lorem.paragraph(2)}
     user_id {rand(6)}
  end
end
