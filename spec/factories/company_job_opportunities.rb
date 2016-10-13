require "faker"

FactoryGirl.define do
  factory :job_event, class: Company::JobOpportunity do
  	title {Faker::Company.profession}
  	shift {shifts[rand(shifts.length)]}
  	description {Faker::Lorem.paragraph(2)} 
  	number_of_positions {rand(10)}
  	status {statuses[rand(statuses.length)]}
  	ctc {rand(10000..50000)}
  	experience {rand(10)}
  end
end