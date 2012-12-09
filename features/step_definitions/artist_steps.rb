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