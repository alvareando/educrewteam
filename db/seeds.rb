# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Review.destroy_all

User.destroy_all
Session.destroy_all

alex = User.create!(email: "alex@lewagon.com", password: "123123", first_name: "Alex", last_name: "Benoit", facebook_picture_url: "https://kitt.lewagon.com/placeholder/users/alex-felix")
seb = User.create!(email: "seb@lewagon.com", password: "123123", first_name: "Seb", last_name: "Saunier", facebook_picture_url: "https://kitt.lewagon.com/placeholder/users/ssaunier")
arthur = User.create!(email: "arthur@lewagon.com", password: "123123", first_name: "Arthur", last_name: "Littmann", facebook_picture_url: "https://kitt.lewagon.com/placeholder/users/arthur-littm")
boris = User.create!(email: "boris@lewagon.com", password: "123123", first_name: "Boris", last_name: "Paillard", facebook_picture_url: "https://kitt.lewagon.com/placeholder/users/papillard")
sandrine = User.create!(email: "sandrine@lewagon.com", password: "123123", first_name: "Sandrine", last_name: "Ayrals", facebook_picture_url: "https://kitt.lewagon.com/placeholder/users/sandrineay")
tutors = [alex, seb, arthur, boris, sandrine]

Session.create!(tutor: alex, title: "Mathematical Modelling", description: description, duration: duration, university: "Queen Mary University", subject: subject,   )

10.times do
  title = ["Cryptography and Coding Theory",
    "Financial and Statistical Modelling",
    "Work Related Learning II",
    "Discrete Mathematics and Group Theory",
    "Computational Mathematic"].sample
  description = [""]
  duration = ["30 minutes", "45 minutes", "2 hours", "1 hour", "3 hours"].sample
  university = ["Queen Mary University", "Imperial College", "UCL", "Kings College", "Cass Business School"].sample
  subject = ["Mathematics"]


  Session.create!(title: title, description: description, duration: duration, university: university, subject: subject, tutor: tutors.sample)
end
