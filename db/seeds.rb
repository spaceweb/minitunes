# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

artists = [{:name => 'Shakira', :description => 'Colombian singer', :similar => 'Paulina Rubio'},
        {:name => 'Paulina Rubio', :description => 'Mexican singer', :similar => 'Shakira'},
     ]

users = [{:name => 'Charlie Brown', :email => 'charlie@brown.com', :profile_name => 'charlieprofile', :password => "123456"}
     ]

artists.each do |artist|
  Artist.create!(artist)
end

users.each do |user|
  User.create!(user)
end