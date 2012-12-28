# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

artists = [{:name => 'Shakira', :description => 'Colombian singer', :similar => 'Paulina Rubio'},
        {:name => 'Paulina Rubio', :description => 'Mexican singer', :similar => 'Shakira'},
        {:name => 'Nelly Furtado', :description => 'Canacian singer', :similar => ['Shakira', 'Paulina Rubio']},
     ]

users = [{:name => 'Charlie Brown', :email => 'charlie@brown.com', :profile_name => 'charlieprofile', :password => "123456"},
         {:name => 'Snoopy', :email => 'snoopy@brown.com', :profile_name => 'snoopyprofile', :password => "234567"},
     ]

artists.each do |artist|
  Artist.create!(artist)
end

users.each do |user|
  User.create!(user)
end

#Relaciones
shakira = Artist.find_by_name('Shakira')
paulina = Artist.find_by_name('Paulina Rubio')
nelly = Artist.find_by_name('Nelly Furtado')

r1 = shakira.adds.build
r2 = paulina.adds.build
r3 = nelly.adds.build

user1 = User.find_by_name('Charlie Brown')
user1.adds << r1
user1.adds << r3
user2 = User.find_by_name('Snoopy')
user2.adds << r2

#Robin retoca esto que no me va, lo que hago es asignarle dos albumes a shakira para ir probando cosas
#albums = [{:name => 'She Wolf', :tracks => 28, :release_date => '9-oct-2009'},
#          {:name => 'Sale El Sol', :tracks => 16, :release_date => '19-oct-2010'},
#     ]

#albums.each do |album|
#  Album.create!(album)
#end

#r3 = shakira.participates.build
#albums.each do |album|
#  album.participates << r3
#end
 
