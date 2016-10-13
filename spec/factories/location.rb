require "faker"

FactoryGirl.define do
  factory :location do
     city {Faker::Address.city}
     street_name {Faker::Address.street_name}
     street_address {Faker::Address.street_address}
     building_name {Faker::Lorem.word}
     building_number {Faker::Address.building_number}
     zipcode {Faker::Address.zip_code}
     state {Faker::Address.state}
     country {Faker::Address.country}
     latitude {Faker::Address.latitude}
     longitude {Faker::Address.longitude}
  end

  
  
end
