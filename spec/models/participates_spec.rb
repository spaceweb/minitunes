require 'spec_helper'

describe Add do
  
  fixtures :albums
  fixtures :artists
  before :each do
    @fake_shakira = artists(:shakira)
    @fake_album = albums(:loba)
  end

  it "creates relationship between Artist-Album" do
    r = @fake_album.participates.build
    @fake_shakira.participates.send(:<<, r)
    @fake_shakira.participates.include?(@fake_album) == true
  end
end
