
require 'spec_helper'

describe ArtistController do 
  
  fixtures :artists
  before :each do
    @fake_shakira = artists(:shakira)
    @fake_paulina = artists(:paulina)
  end
  
  describe "GET show artist" do
    it "call model method find_by_name, assigns all artist as @artist" do
      Artist.should_receive(:find_by_name).and_return(@fake_shakira)
      redirect_to '/Shakira'
      assigns[:artist].should == @fake_shakira
    end
  end
  
end
