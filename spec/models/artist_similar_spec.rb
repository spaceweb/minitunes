require 'spec_helper'

describe ArtistSimilar do
  
  fixtures :artists

  it "creates a similar artist" do
    ArtistSimilar.create artist_id: artists(:shakira).id, similar_id: artists(:paulina).id, similar_name: artists(:paulina).name, artist_id: artists(:shakira).name
    artists(:shakira).artist_similars.include?(artists(:paulina))
  end
end