# Edited 11/14/2019 by Leah Gillespie

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

data_file = File.open '../data-scrape/clubs.txt', 'r'
data_string = data_file.read
data = eval data_string
data.each do |c, d|
  Club.create name: d[:name], mission: d[:mission], link: d[:link], location: d[:location], affiliations: d[:affiliations], service: d[:service]
end