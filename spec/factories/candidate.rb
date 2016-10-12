require "faker"

FactoryGirl.define do
  factory :candidate do
     first_name {Faker::Name.first_name}
     last_name {Faker::Name.last_name}
     dob {Faker::Date.between(50.years.ago,20.years.ago)}
     gender {["M","F","T"][rand(3)]}
     marital_status { ["married","unmarried"][rand(2)]}
     status {[true,false][rand(2)]}
     languages {Faker::Lorem.words.join(',')}
     summary {Faker::Lorem.paragraph(2)}
     association :user, factory: :user, strategy: :build
  end

  factory :invalid_candidate, parent: :candidate do
     dob {nil}
  end

end
