# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

def create_users(user_count=20)
  puts "Generating test users from seed.....(check out file in tmp/test_users.txt)"
  File.open(Rails.root.join('tmp','test_users.txt'),'w') do |file|
    user_count.times do |count|
      email = Faker::Internet.email 
      password = Faker::Internet.password
      file.puts "#{count+1}) #{email}|#{password}"
      user = User.new(email:email,password:password)
      user.save!
    end
  end
end

create_users
