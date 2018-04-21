# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  User.create! email: Faker::Internet.unique.email,
    password: "12345678",
    password_confirmation: "12345678",
    name: Faker::Name.name , avatar: Faker::Avatar.image,
    headline: Faker::Job.title, description: Faker::Lorem.paragraph,
    location: Faker::Address.state, website: Faker::Internet.url,
    salary: Faker::Number.between(10, 150), age: Faker::Number.between(18, 50), 
    telephone: Faker::PhoneNumber.phone_number
end

Company.create name: "FaceBook", headline: Faker::Company.catch_phrase,
  description: Faker::Lorem.paragraph, location: Faker::Address.state,
  website: "https://facebook.com", phone: Faker::PhoneNumber.phone_number,
  email: Faker::Internet.email, avatar: "assets/img/logo-facebook.png"

Company.create name: "Google", headline: Faker::Company.catch_phrase,
  description: Faker::Lorem.paragraph, location: Faker::Address.state,
  website: "https://goole.com", phone: Faker::PhoneNumber.phone_number,
  email: Faker::Internet.email, avatar: "assets/img/logo-google.jpg"

Company.create name: "Microsoft", headline: Faker::Company.catch_phrase,
  description: Faker::Lorem.paragraph, location: Faker::Address.state,
  website: "https://microsoft.com", phone: Faker::PhoneNumber.phone_number,
  email: Faker::Internet.email, avatar: "assets/img/logo-microsoft.jpg"

20.times do |n|
  Job.create user_id: rand(1..10), company_id: rand(1..3),
  description: Faker::Lorem.paragraph, location: Faker::Address.state,
  employment_type: Faker::Job.employment_type, salary: Faker::Number.between(10, 150),
  education_level: Faker::Job.education_level, title: Faker::Job.title
end

10.times do |n|
  Resume.create user_id: "#{n}"
end

10.times do |n|
  Social.create facebook_link: "fb.com/"+Faker::Name.first_name, resume_id: "#{n}"
end

10.times do |n|
  TagList.create name: Faker::Job.key_skill, user_id: "#{n}"
end

res = Resume.first
jobs = Job.all
job = jobs[2..19]
job.each { |job| res.apply job }
