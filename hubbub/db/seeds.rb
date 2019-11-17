# Edited 11/14/2019 by Leah Gillespie
# Edited 11/16/2019 by Neel Mansukhani: Seed fix
# Edited 11/16/2019 by Sri Ramya Dandu: Populated interests table
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Club.destroy_all
data_file = File.open '../data-scrape/clubs.txt', 'r'
data_string = data_file.read
data = eval data_string
data.each do |c, d|
  x = Club.create name: d[:name], mission: d[:mission], link: d[:link], location: d[:location], affiliations: d[:affiliations], service: d[:service]
  x.save
end

Interest.destroy_all
interestsArr = ["Awareness/Activism", "Academic/College", "Cultural/Ethnic", "Community Serivce/Service Learning", "Creative and Performing Arts", "Goverance Organization", "Honoraries/Honor Societies", "Media", "Performing Arts", "Religious/Spiritual", "Social Fraternities/Sororities","Sports and Recreation","Service","Special Interest","Technology"]

interestsArr.each do |interestOption|
  newInterest = Interest.create name: interestOption
  newInterest.save
end 