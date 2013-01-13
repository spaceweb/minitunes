# Add a declarative step here for populating the DB with artist.
Given /the following Albums exist/ do |album_table|
  album_table.hashes.each do |album|
    Album.create!(album)
  end
end

Given /the following Songs exist/ do |song_table|
  song_table.hashes.each do |song|
    Song.create!(song)
  end
end

Given /^the relation artist-album "(.+)" and "(.+)"$/ do |one, two|
   artist = Artist.find_by_name(one)
   album = Album.find_by_name(two)
   r1 = album.participates.build
   artist.participates<< r1
end
