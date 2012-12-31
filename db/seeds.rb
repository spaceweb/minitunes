# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

artists = [{:name => 'Shakira', :description => 'Colombian singer'},
        {:name => 'Paulina Rubio', :description => 'Mexican singer'},
        {:name => 'Nelly Furtado', :description => 'Canacian singer'},
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

#Albums
albums = [{:name => 'She Wolf', :tracks => 28, :release_date => '9-oct-2009'},
          {:name => 'Sale El Sol', :tracks => 16, :release_date => '19-oct-2010'},
     ]

albums.each do |album|
  Album.create!(album)
end
#Relaciones
album1 = Album.find_by_name('She Wolf')
album2 = Album.find_by_name('Sale El Sol')
r1 = album1.participates.build
r2 = album2.participates.build

shakira.participates << r1
shakira.participates << r2

#Songs
songs = [{:name => 'Whenever, Wherever'},
         {:name => 'Loba'},
     ]
songs.each do |song|
  Song.create!(song)
end
#Relaciones
song1 = Song.find_by_name('Whenever, Wherever')
song2 = Song.find_by_name('Loba')
r1 = song1.contains.build
r2 = song2.contains.build

album1.contains << r1
album1.contains << r2



## Artistas similares
ArtistSimilar.create(artist_id: shakira.id, similar_name: paulina.name, artist_name: shakira.name)
ArtistSimilar.create(artist_id: nelly.id, similar_name: shakira.name, artist_name: nelly.name)

