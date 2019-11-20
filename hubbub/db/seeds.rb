# Edited 11/14/2019 by Leah Gillespie: added seed data for clubs from cache
# Edited 11/16/2019 by Neel Mansukhani: Seed fix
# Edited 11/16/2019 by Sri Ramya Dandu: Populated interests table
# Edited 11/16/2019 by Neel Mansukhani: Created fake user and match data.
# Edited 11/18/2019 by Leah Gillespie: Fixed typo
# Edited 11/20/2019 by Neel Mansukhani: Added a destroy_all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Club.destroy_all
User.destroy_all
ClubMatch.destroy_all
Interest.destroy_all
ClubInterest.destroy_all

interestsArr = ["Awareness/Activism", "Academic/College", "Cultural/Ethnic", "Community Service/Service Learning", "Creative and Performing Arts", "Goverance Organization", "Honoraries/Honor Societies", "Media", "Performing Arts", "Religious/Spiritual", "Social Fraternities/Sororities","Sports and Recreation","Service","Special Interest","Technology"]
interestsArr.each do |interestOption|
  newInterest = Interest.create name: interestOption
  newInterest.save
end

data_file = File.open '../data-scrape/clubsimg.txt', 'r'
data_string = data_file.read
data = eval data_string
data.each do |c, d|
  x = Club.create name: d[:name], mission: d[:mission], link: d[:link], location: d[:location], affiliations: d[:affiliations], img: d[:img]
  x.save
  interests = x.affiliations
  interestOptions = Interest.all
  interestOptions.each { |aff|
    unless interests.index(aff.name).nil?
      c = ClubInterest.create :club_id => x.id, :interest_id => aff.id
      c.save
    end
  }
end

User.create({:email => "mansukhani.9@osu.edu", :role => 2, :password => "111111", :password_confirmation => "111111" , :first_name => "Neel", :last_name => "Mansukhani", :grad_year => "2021", :gender => "Male"}).save
User.create({:email => "wing.49@osu.edu", :role => 2, :password => "111111", :password_confirmation => "111111" , :first_name => "David", :last_name => "Wing", :grad_year => "2021", :gender => "Male"}).save
User.create({:email => "gillespie.267@osu.edu", :role => 2, :password => "111111", :password_confirmation => "111111" , :first_name => "Leah", :last_name => "Gillespie", :grad_year => "2021", :gender => "Female"}).save
User.create({:email => "dandu.7@osu.edu", :role => 2, :password => "111111", :password_confirmation => "111111" , :first_name => "Sri Ramya", :last_name => "Dandu", :grad_year => "2021", :gender => "Female"}).save
User.create({:email => "qiu.374@osu.edu", :role => 2, :password => "111111", :password_confirmation => "111111" , :first_name => "Sharon", :last_name => "Qiu", :grad_year => "2021", :gender => "Female"}).save
50.times do |i|
  name = "User" + (i+1).to_s
  email = name + "@gmail.com"
  rand(0..1) == 0 ? gender = "Female" : gender = "Male"
  grad_year = rand 1950..2050
  User.create({:email => email, :role => 0, :password => "111111", :password_confirmation => "111111" , :first_name => name, :last_name => "User", :grad_year => grad_year.to_s, :gender => gender}).save
end
1000.times do |i|
  user = User.order("RANDOM()").limit(1)[0]
  club = Club.order("RANDOM()").limit(1)[0]
  if user.clubs.include? club
    next
  else
    ClubMatch.create({:user_id => user.id,:club_id => club.id,:matched => 1}).save
  end
end

