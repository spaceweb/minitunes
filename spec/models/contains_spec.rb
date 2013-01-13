require 'spec_helper'

describe Add do
  
  fixtures :albums
  fixtures :songs
  before :each do
    @fake_song = songs(:track1)
    @fake_album = albums(:loba)
  end

  it "creates relationship between Album-Song" do
    r = @fake_song.contains.build
    @fake_album.contains.send(:<<, r)
    @fake_album.contains.include?(@fake_song) == true
  end
end
