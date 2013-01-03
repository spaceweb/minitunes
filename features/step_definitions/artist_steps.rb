# Add a declarative step here for populating the DB with artist.
Given /the following Artists exist/ do |artist_table|
  artist_table.hashes.each do |artist|
    Artist.create!(artist)
  end
end

Then /"(.+)" should be similar to "(.+)"$/ do |artist, similar|
  obj = Artist.find_by_name(artist)
  similar.should == obj.similar
end

Then /I should see similar artist "(.+)"/ do |artist|
  print page.body
  page.should have_content(artist)
end

Given /"(.+)" and "(.+)" are similars/ do |one, two|
  shakira = Artist.find_by_name(one)
  paulina = Artist.find_by_name(two)
  ArtistSimilar.create(artist_id: shakira.id, 
                    similar_name: paulina.name, 
                    artist_name: shakira.name)

  ArtistSimilar.create(artist_id: paulina.id, 
                    similar_name: shakira.name, 
                    artist_name: paulina.name)
end

Given /^the relation "(.+)" and "(.+)"$/ do |one, two|
   user = User.find_by_name(one)
   artist = Artist.find_by_name(two)
   r1 = artist.adds.build
   user.adds << r1
end
  