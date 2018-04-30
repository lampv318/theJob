# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create email: "admin@admin.com", account_name: "admin", password: "12345678", 
  password_confirmation: "12345678", admin: "true"

20.times do |n|
  User.create! email: Faker::Internet.email, account_name: Faker::Name.first_name,
    password: "12345678", password_confirmation: "12345678"
end

20.times do |n|
  Resume.create user_id: "#{n}"
end

20.times do |n|
  BasicInfo.create user_id: "#{n}" , resume_id: "#{n}", user_avatar: Faker::Avatar.image,
    full_name: Faker::Name.name, headline: Faker::Job.title ,
    description: Faker::Lorem.paragraph, location: Faker::Address.state,
    website: Faker::Internet.url, salary: Faker::Number.between(10, 210), 
    age: Faker::Number.between(18, 50), phone: Faker::PhoneNumber.phone_number,
    email_address: Faker::Internet.email
end

55.times do |n|
  Job.create user_id: rand(1..20), company_name: Faker::Company.name, 
  description: Faker::Lorem.paragraph, location: Faker::Address.state,
  employment_type: Faker::Job.employment_type, salary: Faker::Number.between(10, 210),
  education_level: Faker::Job.education_level, title: Faker::Job.title, url: Faker::Internet.url,
  working_hour: Faker::Number.between(10, 40), experience:  Faker::Number.between(0, 4)
end

Job.create user_id: rand(1..10), company_name: "Facebook",
  company_avatar: "https://raw.githubusercontent.com/lampv318/image/master/logo-facebook.png",
  title: Faker::Job.title, description: Faker::Lorem.paragraph, location: Faker::Address.state,
  employment_type: Faker::Job.employment_type, salary: Faker::Number.between(10, 210),
  education_level: Faker::Job.education_level, working_hour: Faker::Number.between(10, 40),
  experience:  Faker::Number.between(0, 4)

Job.create user_id: rand(1..10), company_name: "MRSO",
  company_avatar: "https://raw.githubusercontent.com/lampv318/image/master/MRSO.png",
  title: Faker::Job.title, description: Faker::Lorem.paragraph, location: "Tokyo",
  employment_type: Faker::Job.employment_type, salary: Faker::Number.between(10, 210),
  education_level: Faker::Job.education_level, working_hour: Faker::Number.between(10, 40),
  experience:  Faker::Number.between(0, 4)

Job.create user_id: rand(1..10), company_name: "Money Forward",
  company_avatar: "https://raw.githubusercontent.com/lampv318/image/master/MF.png",
  title: Faker::Job.title, description: Faker::Lorem.paragraph, location: "Tokyo",
  employment_type: Faker::Job.employment_type, salary: Faker::Number.between(10, 210),
  education_level: Faker::Job.education_level, working_hour: Faker::Number.between(10, 40),
  experience:  Faker::Number.between(0, 4)

Job.create user_id: rand(1..10), company_name: "Microsoft",
  company_avatar: "https://raw.githubusercontent.com/lampv318/image/master/logo-microsoft.jpg",
  title: Faker::Job.title, description: Faker::Lorem.paragraph, location: Faker::Address.state,
  employment_type: Faker::Job.employment_type, salary: Faker::Number.between(10, 210),
  education_level: Faker::Job.education_level, working_hour: Faker::Number.between(10, 40),
  experience:  Faker::Number.between(0, 4)

  
Job.create user_id: rand(1..10), company_name: "Raksul",
  company_avatar: "https://raw.githubusercontent.com/lampv318/image/master/Raksul.png",
  title: Faker::Job.title, description: Faker::Lorem.paragraph, location: "Tokyo",
  employment_type: Faker::Job.employment_type, salary: Faker::Number.between(10, 210),
  education_level: Faker::Job.education_level, working_hour: Faker::Number.between(10, 40),
  experience:  Faker::Number.between(0, 4)
Job.create user_id: rand(1..10), company_name: "Google",
  company_avatar: "https://raw.githubusercontent.com/lampv318/image/master/logo-google.jpg",
  title: Faker::Job.title, description: Faker::Lorem.paragraph, location: Faker::Address.state,
  employment_type: Faker::Job.employment_type, salary: Faker::Number.between(10, 210),
  education_level: Faker::Job.education_level, working_hour: Faker::Number.between(10, 40),
  experience:  Faker::Number.between(0, 4)

56.times do |n|
  JobDetail.create job_id: "#{n}", content: Faker::Lorem.paragraph
end

20.times do |n|
  Social.create facebook_link: "https://fb.com/"+Faker::Name.first_name, resume_id: "#{n}"
  Social.create facebook_link: "https://twitter.com/"+Faker::Name.first_name, resume_id: "#{n}"
  Social.create facebook_link: "https://github.com/"+Faker::Name.first_name, resume_id: "#{n}"
  Social.create facebook_link: "https://google.com/"+Faker::Name.first_name, resume_id: "#{n}"
end

20.times do |n|
  TagList.create tag_name: Faker::Job.key_skill, user_id: "#{n}", resume_id: "#{n}"
  TagList.create tag_name: Faker::Job.key_skill, user_id: "#{n}", resume_id: "#{n}"
  TagList.create tag_name: Faker::Job.key_skill, user_id: "#{n}", resume_id: "#{n}"
end

20.times do |n| 
  Education.create degree: Faker::Job.education_level, school_name: Faker::Educator.university,
    resume_id: "#{n}", major: Faker::Job.field, description: Faker::Lorem.paragraph
end

20.times do |n|
  Skill.create resume_id: "#{n}", name: "CSS", proficiency: Faker::Number.between(20, 100)
end

20.times do |n|
  Skill.create resume_id: "#{n}", name: "HTML", proficiency: Faker::Number.between(20, 100)
end

20.times do |n|
  Skill.create resume_id: "#{n}", name: "Photoshop", proficiency: Faker::Number.between(20, 100)
end

20.times do |n|
  Skill.create resume_id: "#{n}", name: "Javascipt", proficiency: Faker::Number.between(20, 100)
end

20.times do |n|
  Skill.create resume_id: "#{n}", name: "Teamwork", proficiency: Faker::Number.between(20, 100)
end

20.times do |n|
  Skill.create resume_id: "#{n}", name: "ReactJS", proficiency: Faker::Number.between(20, 100)
end

20.times do |n|
  WorkExperience.create resume_id: "#{n}", company: Faker::Company.name, 
  position: Faker::Job.position, description: Faker::Lorem.paragraph
end

res = Resume.first
jobs = Job.all
job = jobs[2..40]
job.each { |job| res.apply job }
