# This will guess the User class
# FactoryGirl.define do
#   factory :candidate do
#     first_name "John"
#     last_name  "Doe"
#     # admin false
#   end

  # This will use the User class (Admin would have been guessed)
  # factory :admin, class: User do
  #   first_name "Admin"
  #   last_name  "User"
  #   admin      true
  # end
# end


# FactoryGirl.define do

	# name:"jay",end_date:Time.now,description:"dkald",shift_type:"intern",email:"jayesh@amuratech.com"

  # factory :experience do
  # 	name = Faker::Name.first_name
  # 	end_date = Faker::Date.between_except(50.year.ago, 0.year.from_now, Date.today)
  # 	description = Faker::Lorem.sentences(3)
  # 	shift_type = "intern"
  # 	email = Faker::Internet.free_email
  # end

# end