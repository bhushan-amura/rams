require "faker"

FactoryGirl.define do
  factory :job_opportunity, class: Company::JobOpportunity do
    title {Faker::Company.profession}
    shift {["full-time","part-time","internship"][rand(["full-time","part-time","internship"].length)]}
    description {Faker::Lorem.paragraph(2)}
    number_of_positions {rand(1..10)}
    status {[true,false][rand([true,false].length)]}
    ctc {rand(10000..50000)}
    experience {rand(10)}
    association :company, factory: :company, strategy: :build
  end
end
