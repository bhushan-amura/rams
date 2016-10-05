require "faker"

FactoryGirl.define do
  factory :location do |f|
    f.city:Faker::Address.city
    f.street_name:Faker::Address.street_name
    f.street_address:Faker::Address.street_address
    f.building_name:Faker::Lorem.word
    f.building_number:Faker::Address.building_number
    f.zipcode:Faker::Address.zip_code
    f.state:Faker::Address.state
    f.country:Faker::Address.country
    f.latitude:Faker::Address.latitude
    f.longitude:Faker::Address.longitude
  end
end
