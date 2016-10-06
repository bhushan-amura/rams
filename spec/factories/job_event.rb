require "faker"

FactoryGirl.define do
  factory :event, class: Company::Event do
    event_type {Faker::Lorem.word}
    date_time {Faker::Time.between(DateTime.now, DateTime.now+rand(365))}
    organiser {Faker::Lorem.word}
    duration {rand(10)}
    association :company_job_opportunity_id, factory: :job_opportunity, strategy: :build
  end
end
