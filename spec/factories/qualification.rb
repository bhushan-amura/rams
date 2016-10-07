require "faker"

FactoryGirl.define do
  factory :qualification do
     domain {Faker::Lorem.word}
     association :institute
    #  association :qualification, factory: :qualification, strategy: :build
  end
end
