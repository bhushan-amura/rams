# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

def create_users(user_count=75)
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

def create_admins(admin_count=5)
  puts "Generating admins from seed....(check out file in tmp/admin_users.txt)"
  admin_users = User.limit(5)
  File.open(Rails.root.join('tmp','admin_users.txt'),'w') do |file|
    admin_count.times do |count|
      admin = Admin.new(user_id:admin_users[count].id)
      admin.save!
      file.puts "#{count+1}) #{admin_users[count].email}"
    end
  end
end


def create_qualifications(qualification_count=20)
  puts "Generating qualifications from seed....."
  qualification_count.times do |count|
    qualification = Qualification.new  # TODO : Fill in the values
    qualification.save!
  end
end



def create_skills(skill_count=50)
  puts "Generating skills from seed....."
  skill_count.times do |count|
    skill = Skill.new # TODO : Fill in the values
    skill.save!
  end
end


# COMPANY SEED :start 

def create_company(company_count=20)
  puts "Generating companies from seed.....(check out file in tmp/company_users.txt)"
  company_users = User.offset(5).limit(20)
  File.open(Rails.root.join('tmp','company_users.txt'),'w') do |file|
    company_count.times do |count|
      company = Company.new(name:Faker::Company.name,company_type:Faker::Company.suffix,url:Faker::Internet.url,tagline:Faker::Company.catch_phrase,phone:Faker::PhoneNumber.phone_number,number_of_employees:rand(100),description:Faker::Lorem.paragraph(3),logo:Faker::Company.logo)
      company.save!
      file.puts "#{count+1}) #{company_users[count].email}"
    end
  end
end

def create_jobs
  puts "Generating job for companues from seed...."
  company_users = Company.all
  company_users.each do |company|
    job_count = rand(10)
    job_count.times do |j|
      job = Company::JobOpportunity.new() # TODO : Fill in the fields
      company.job_opportunities << job
    end
  end
end


def create_events
  puts "Generating events for job openings of companies from seed...."
  job_opportunities = Company::JobOpportunity.all
  job_opportunities.each do |job|
    event_count = rand(6)
    event_count.times do |e|
      event = Company::Event.new() # TODO : Fill in the fields
      job_opportunities.events << event
    end
  end
end

def assign_qualification_job
end

def assign_skills_job
end

# COMPANY SEED : end

def create_tests(test_count=100)
  puts "Generating tests from seed...."
  test_count.times do |count|
    test = Test.new # TODO : Fill in the values
    test.save!
  end
end

# CANDIDATE SEED : start 
def create_candidates(candidate_count=50)
  puts "Generating candidates from seed.....(check out file in tmp/candidate_users.txt)"
  candidate_users = User.offset(25).limit(40)
  File.open(Rails.root.join('tmp','company_users.txt'),'w') do |file|
    candidate_count.times do |count|
      genders = ["M","F","T"]
      marital_statuses = ["married","unmarried"]
      statuses = [true,false]

      candidate = Candidate.new(first_name:Faker::Name.first_name,last_name:Faker::Name.last_name,dob:Faker::Date.between(50.years.ago,20.years.ago),gender:genders[rand(3)],marital_status:marital_statuses[rand(2)],status:statuses[rand(2)],languages:Faker::Lorem.words.join(','),summary:Faker::Lorem.paragraph(2))
      candidate.save!
      file.puts "#{count+1}) #{candidate_users[count].email}"
    end
  end
end

def create_achievements
  puts "Generating achievements of candidates from seed...."
  candidate_users = Candidate.all
  candidate_users.each do |candidate|
    achievement_count = rand(6)
    achievement_count.times do |a| 
      achievement = Candidate::Achievement.new()  #TODO : FIll in the values
      candidate.achievements << achievement
    end
  end
end


def create_experiences
  puts "Generating experiences of candidates from seed...." 
  candidate_users = Candidate.all
  candidate_users.each do |candidate|
    experience_count = rand(5)
    experience_count.times do |e|
      experience = Candidate::Experience.new() #TODO : Fill in the values
      candidate.experiences << experience
    end
  end
end

def create_links
  puts "Generating links of candidates from seed....."
  candidate_users = Candidate.all
  candidate_users.each do |candidate|
    link_count = rand(6)
    link_names = ["github","linkedin","codechef","codewars","website"]
    link_count.times do |l|
      link = Candidate::Link.new # TODO : Fill in the values 
      candidate.links << link
    end
  end
end


def create_projects
  puts "Generating projects of candidates from seed....."
  candidate_users = Candidate.all
  candidate_users.each do |candidate|
    project_count = rand(5)
    project_count.times do |p|
      project = Candidate::Project.new # TODO : Fill in the values
      candidate.projects << project
    end
  end
end

def create_references
  puts "Generating references of candidates from seed....."
  candidate_users = Candidate.all
  candidate_users.each do |candidate|
    reference_count = rand(3)
    reference_count.times do |r|
      reference = Candidate::Reference.new # TODO : Fill in the values
      candidate.references << reference
    end
  end
end

def assign_qualification_candidate
  puts "Assigning qualification to candidates....."
  qualifications = Qualification.all
  candidates = Candidate.all
  candidates.each do |candidate|
    qualification_count = rand(5)
    qualification_count.times do |count|
      candidate.qualifications << qualifications[rand(qualifications.length)]
    end
  end
end

def create_course_scores
  puts "Assigning course scores to candidate qualifications....."
  candidates = Candidate.all
  candidates.each do |candidate|
    candidates.qualifications.each do |qualification|
      qualification.course_score = CourseScore.new # TODO : Fill in the values
    end
  end
end

def assign_skill_candidate
  puts "Assigning skill to candidates from seed....."
  candidates = Candidate.all
  skills = Skill.all
  candidates.each do |candidate|
    skill_count = rand(10)
    skill_count.times do |count|
      candidate.skills << skills[rand(skills.length)]
    end
  end
end

def assign_test_scores
  puts "Assigning test scores to candidates from seed....."
  candidates = Candidate.all
  tests = Test.all
  candidates.each do |candidate|
    test_count = rand(10)
    test_count.times do |count| 
      candidate.test_scores << Candidate::TestScore(test_id:tests[rand(tests.length)].id) # TODO :Fill in the values
    end
  end
end
# CANDIDATE Seed : End

def create_location_candidate
  puts "Assigning locations to candidates...."
  candidates = Candidate.all
  candidates.each do |candidate|
    candidate.location = Location.new # TODO : Fill in the values 
  end
end

def create_location_company
  puts "Assigning locations to company...."
  companies = Company.all
  companies.each do |company|
    company.location = Location.new
  end
end

def create_reviews(review_count=100)
  puts "Genrating reviews for companies by candidates from seed...."
  review_count.times do |count|
    review = Review.new # TODO : Fill in the values
    review.save!
  end
end

create_users
create_admins
create_company
create_candidates
