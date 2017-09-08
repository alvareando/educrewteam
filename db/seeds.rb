# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Review.destroy_all
SessionParticipation.destroy_all
Session.destroy_all
User.destroy_all

dixon = User.create!(tutor: true, about: "I have studied for now 5 years and very proficient in the courses that I teach on EduCrew", email: "dixon@lewagon.com", password: "123123", first_name: "Dixon", last_name: "Lewis", facebook_picture_url: "https://kitt.lewagon.com/placeholder/users/dixonlewissuarez")
alex = User.create!(tutor: true, about: "I have studied for now 5 years and very proficient in the courses that I teach on EduCrew", email: "alex@lewagon.com", password: "123123", first_name: "Alex", last_name: "Benoit", facebook_picture_url: "https://kitt.lewagon.com/placeholder/users/alex-felix")
seb = User.create!(tutor: true, about: "I have studied for now 5 years and very proficient in the courses that I teach on EduCrew", email: "seb@lewagon.com", password: "123123", first_name: "Seb", last_name: "Saunier", facebook_picture_url: "https://kitt.lewagon.com/placeholder/users/ssaunier")
arthur = User.create!(tutor: true, about: "I have studied for now 5 years and very proficient in the courses that I teach on EduCrew", email: "arthur@lewagon.com", password: "123123", first_name: "Arthur", last_name: "Littmann", facebook_picture_url: "https://kitt.lewagon.com/placeholder/users/arthur-littm")
boris = User.create!(tutor: true, about: "I have studied for now 5 years and very proficient in the courses that I teach on EduCrew", email: "boris@lewagon.com", password: "123123", first_name: "Boris", last_name: "Paillard", facebook_picture_url: "https://kitt.lewagon.com/placeholder/users/papillard")
sandrine = User.create!(tutor: true, about: "I have studied for now 5 years and very proficient in the courses that I teach on EduCrew", email: "sandrine@lewagon.com", password: "123123", first_name: "Sandrine", last_name: "Ayrals", facebook_picture_url: "https://kitt.lewagon.com/placeholder/users/sandrineay")
tutors = [alex, seb, arthur, boris, sandrine]

titles = ["Cryptography and Coding Theory",
  "Financial and Statistical Modelling",
  "Work Related Learning II",
  "Discrete Mathematics and Group Theory",
  "Computational Mathematic"]

descriptions = ["Topology is the abstract study of continuity: the basic objects of study are metric and topological spaces, and the continuous maps between them.",
  "The most famous application of Galois theory – discussed at the end of this course – is the proof that the general quintic equation with rational coefficients cannot be solved by radicals.",
  "This course is complementary to Part II Principles of Statistics, but takes a more applied perspective. The session will cover linear and generalised linear models, which provide a powerful and flexible framework for the study of the relationship between a response (e.g. alcohol consumption) and one or more explanatory variables (age, sex etc.).",
  "Functional Analysis provides the framework, and a great deal of machinery, for much of modern mathematics: not only for pure mathematics (such as harmonic analysis and complex analysis) but also for the applications of mathematics, such as probability theory, the ordinary and partial differential equations met in applied mathematics, and the mathematical formulation of quantum mechanics.",
  "Quick theory for 15 minutes but then, practice practice practice during 45 minutes."]

durations = ["30 minutes", "45 minutes", "2 hours", "1 hour", "3 hours"]

universities = ["Queen Mary University", "Imperial College", "UCL", "Kings College", "Cass Business School"]

subjects = ["Mathematics", "Economics", "Finance", "Computer Science"]

prices = [5, 8, 10, 12, 15, 20, 220, 250]

dates = [Date.today + 2.days, Date.today + 10.days, Date.today + 3.days, Date.today + 20.days, Date.today + 30.days, Date.today + 50.days, Date.today + 6.days, Date.today + 18.days]

times = [Time.now + 3.hours, Time.now + 3.hours, Time.now + 10.hours, Time.now + 8.hours, Time.now + 3.hours, Time.now + 1.hours]

10.times do
  title = titles.sample
  description = descriptions.sample
  duration = durations.sample
  university = universities.sample
  subject = subjects.sample
  price = prices.sample
  date = dates.sample
  time = times.sample

  session = Session.create!(title: title, description: description, duration: duration, university: university, subject: subject, tutor: tutors.sample, price: price, date: date, time: time)
  new_chatroom = Chatroom.create!
  session.chatroom = new_chatroom
end


title = titles.sample
description = descriptions.sample
duration = durations.sample
university = universities.sample
subject = "Mathematics"
price = prices.sample
date = dates.sample
time = times.sample

dixon_session_over = Session.create!(tutor: dixon, title: "Intro to Maths", description: "This course is complementary to Part II Principles of Statistics, but takes a more applied perspective. The session will cover linear and generalised linear models, which provide a powerful and flexible framework for the study of the relationship between a response (e.g. alcohol consumption) and one or more explanatory variables (age, sex etc.).", duration: duration, university: "Queen Mary University", subject: subject, price: price, date: Date.today - 10.days, time: Time.now - 3.hours )
new_chatroom = Chatroom.create!
dixon_session_over.chatroom = new_chatroom

dixon_session = Session.create!(tutor: dixon, title: "Mathematical Modelling", description: "This course is complementary to Part II Principles of Statistics, but takes a more applied perspective. The session will cover linear and generalised linear models, which provide a powerful and flexible framework for the study of the relationship between a response (e.g. alcohol consumption) and one or more explanatory variables (age, sex etc.).", duration: duration, university: "Queen Mary University", subject: subject, price: price, date: Date.today, time: Time.new(2000, 01, 01, 19, 00, 00, '+01:00') )
new_chatroom = Chatroom.create!
dixon_session.chatroom = new_chatroom

Review.create!(user: seb, session: dixon_session_over, body: "Great Tutor, really knew his stuff!")
Review.create!(user: boris, session: dixon_session_over, body: "Was a great help just before my math test")
Review.create!(user: arthur, session: dixon_session_over, body: "I really liked his way of teaching")
Review.create!(user: sandrine, session: dixon_session_over, body: "Very pedantic! He is a nice guy")

